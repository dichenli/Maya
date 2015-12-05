function [ Y_test, predict_test ] = predict_lasso_word( X_train, X_test, Y_train )
%UNTITLED2 Summary of this function goes here
%   trainset, testset: like 1:3000, 3000:4998, etc. a vector of data taken
%   for training and test

Lambda = 0.01; % see try_words for its origin

[B_lasso, FitInfo] = lasso( X_train, Y_train, 'Lambda', Lambda); 
Y_test = X_test * B_lasso + FitInfo.Intercept;
predict_test = Y_test;
predict_test(Y_test <= 0.5) = 0;
predict_test(Y_test > 0.5) = 1;
Y_test = Y_test - 0.5;

end

