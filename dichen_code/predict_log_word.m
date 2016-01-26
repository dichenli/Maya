function [ prob_log_word, deci_log_word ] = predict_log_word( Xtrain, Xtest, Ytrain )
% predict word by logistic regression. Requires glmnet library. 
% See https://cran.r-project.org/web/packages/glmnet/index.html
% makesure glmnet_matlab folder is in this directory
    addpath ./glmnet_matlab;
    options = glmnetSet;
    cvfit = cvglmnet(Xtrain, Ytrain, 'binomial', options, 'class');
    deci_log_word = cvglmnetPredict(cvfit, Xtest, 'lambda_min', 'class');
    prob_log_word = cvglmnetPredict(cvfit, Xtest, 'lambda_min');
end

