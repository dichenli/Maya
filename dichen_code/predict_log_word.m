function [ prob_log_word, deci_log_word ] = predict_log_word( Xtrain, Xtest, Ytrain )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
options = glmnetSet;
cvfit = cvglmnet(Xtrain, Ytrain, 'binomial', options, 'class');
deci_log_word = cvglmnetPredict(cvfit, Xtest, 'lambda_min', 'class');
prob_log_word = cvglmnetPredict(cvfit, Xtest, 'lambda_min');
end

