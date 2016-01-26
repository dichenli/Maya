% word_test = importdata('../test/words_test.txt');
% word_train = importdata('../train/words_train.txt');
% genders_train = importdata('../train/genders_train.txt');

% k2 = kernel_intersection_1204(word_train(:, 1:1000), word_test(:, 1:1000));

% k1 = kernel_intersection(word_train(1:10, 1:10), word_test(1:10, 1:10));
% k2 = kernel_intersection_1204(word_train(1:10, 1:10), word_test(1:10, 1:10));
% k1 - k2; % no problem
% k = kernel_poly(word_train, word_test, 10);
% addpath libsvm;
% which -all svmtrain;
% model1 = svm_train( word_train, genders_train, @(x,x2) kernel_poly(x, x2, 2) );
% save('model.mat', 'model1');

%%
% feature selection & train
% load('remained_idx.mat');

% deletion_table = word_feature_selection( word_train, genders_train );
% save('word_deletion_table.mat', 'deletion_table');

% Xtrain = word123(:,remained_idx);
% Ytrain = Y123;
% [svm_model_word_3000] = svm_mod_train(Xtrain, Ytrain);
% save('svm_model_word_3000.mat', 'svm_model_word_3000', 'remained_idx');

%test
% addpath ./libsvm-mod
% Y_test_fake = zeros(size(word_test,1),1);
% [yhat acc vals] = svmpredict(Y_test_fake, word_test(:,remained_idx), svm_model_word_3000);

% test_err = mean(yhat~=Y3);
% info.vals = vals;
% info.yhat = yhat;
% info.acc = acc;
% info.model = model1;


%% results records
% use full train and test
% svmpredict 531.790 s
% svm_mod_train 176.460 s
% use only selected 3000 features: 750s
% use only selected 3000 features accuracy: 86.1148
% on biglab: all features, 7min30s. 3000 features: 4min40s. It's completely
% proportional. 

%% generate prob_deci

[model1] = svm_mod_train(word1(:,remained_idx), Y1);
[deci_word_svm1_4000 acc1 prob_word_svm1_4000] = svmpredict(Y2, word2(:,remained_idx), model1);

[model2] = svm_mod_train(word12(:,remained_idx), Y12);
[deci_word_svm2_4000 acc2 prob_word_svm2_4000] = svmpredict(Y3, word3(:,remained_idx), model2);

[model3] = svm_mod_train(word123(:,remained_idx), Y123);
Y_test_fake = zeros(size(word_test,1), 1);
[deci_word_svm3_4000 acc3 prob_word_svm3_4000] = svmpredict(Y_test_fake, word_test(:,remained_idx), model3);
save('word_svm_4000.mat', 'deci_word_svm1_4000', 'deci_word_svm2_4000', 'deci_word_svm3_4000', 'prob_word_svm1_4000', 'prob_word_svm2_4000', 'prob_word_svm3_4000' );
word_svm_4000_model1 = model1;
word_svm_4000_model2 = model2;
word_svm_4000_model3 = model3;
save('word_svm_4000_models.mat', 'word_svm_4000_model1', 'word_svm_4000_model2', 'word_svm_4000_model3');



