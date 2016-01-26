function [ predication ] = logistic_regression_word( Xtrain, Ytrain, Xtest )
% predict word by logistic regression. Requires glmnet library. 
% See https://cran.r-project.org/web/packages/glmnet/index.html
% makesure glmnet_matlab folder is in this directory
    addpath ./glmnet_matlab;
    options = glmnetSet;
    cvfit = cvglmnet(Xtrain, Ytrain, 'binomial', options, 'class');
    predication = cvglmnetPredict(cvfit, Xtest, 'lambda_min', 'class');
end

