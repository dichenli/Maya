addpath('glmnet_matlab');
close all;

Xtrain = [word1; word2];
Xtest = word3;
Ytrain = [Y1;Y2];
Ytest = Y3;
train_size = size(Ytrain, 1);
test_size = size(Ytest, 1);

%% use matlab mnrfit
% [B_log,dev,stats] = mnrfit(Xtrain, Ytrain + 1); % Y is labeled as 1, 2 to avoid crash
% predict_train = exp(Xtrain * B_log);
% predict_train(predict_train <= 1) = 1;
% predict_train(predict_train > 1) = 0;
% diff = predict_train ~= genders_train(1:3000, :);
% accuracy_train = size(diff(diff == 0), 1) / 3000;

% X_test = [ones(test_size, 1) Xtest];
% Y_prob = exp(Xtest * B_log);
% Y_deci = Y_prob;
% Y_deci(Y_prob <= 1) = 1;
% Y_deci(Y_prob > 1) = 0;
% diff = Y_deci ~= Ytest;
% Y_prob_diff = Yprob(diff);
% Y_prob_same = Yprob(~diff);
% figure(4);
% histogram(Y_test_same);
% figure(5);
% histogram(Y_test_diff);
% figure(6);
% histogram(Y_prob);
% accuracy_test_logistic = size(diff(diff == 0), 1) / test_size;

%% glmnet
options = glmnetSet;
% options.standardize = false; % useless, it drops accuracy to 0.7891
% options.alpha = 0; % dropped to 0.8238
cvfit = cvglmnet(Xtrain, Ytrain, 'binomial', options, 'class');
% figure(1);
% cvglmnetPlot(cvfit);

% accuracy
cvPred = cvglmnetPredict(cvfit, Xtest, 'lambda_min', 'class');
same = cvPred == Ytest;
accuracy_log_word = sum(same) / test_size;

% 
cvProb = cvglmnetPredict(cvfit, Xtest, 'lambda_min');
cvProbMale = cvProb(Ytest == 0);
cvProbFemale = cvProb(Ytest == 1);
figure(1);
hold on;
histogram(nthroot(cvProbMale, 3), 100);
histogram(nthroot(cvProbFemale, 3), 100);
% also, try sin? first shrink prob to (-1, 1) range
hold off;