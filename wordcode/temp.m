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

[model] = svm_mod_train(word_train, genders_train);
 
[yhat acc vals] = svmpredict(genders_test, word_test, model);
test_err = mean(yhat~=Ytest);
info.vals = vals;
info.yhat = yhat;
info.acc = acc;
info.model = model;