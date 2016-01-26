function [ prediction ] = elastic_net_img_feature( Xtrain, Ytrain, Xtest )
%   elastic_net regression of word
    [B_lasso, FitInfo] = lasso( Xtrain, Ytrain, 'Lambda', 0.001, 'alpha', 0.5); 
    Ytest = Xtest * B_lasso + FitInfo.Intercept;
    prediction = Ytest;
    prediction(Ytest <= 0.5) = 0;
    prediction(Ytest > 0.5) = 1;
end