function [ prediction ] = elastic_net_word( Xtrain, Ytrain, Xtest )
%   elastic_net regression of word
    [B_lasso, FitInfo] = lasso( Xtrain, Ytrain, 'Lambda', 0.001, 'alpha', 0.5); 
    Ytest = Xtest * B_lasso + FitInfo.Intercept;
    prediction = Ytest;
    prediction(Y_test <= 0.5) = 0;
    prediction(Y_test > 0.5) = 1;
end