function [ Y_test, predict_test ] = predict_ridge_img_feat( X_train, X_test, Y_train )
%UNTITLED2 Summary of this function goes here
%   trainset, testset: like 1:3000, 3000:4998, etc. a vector of data taken
%   for training and test

k = 304;

b_ridge = ridge(Y_train, X_train, k, 0);
% train_size = size(Y_train, 1);
% X_train = [ones(train_size, 1) X_train];
test_size = size(X_test, 1);
X_test = [ones(test_size, 1) X_test];
Y_test = X_test * b_ridge;
predict_test = Y_test;
predict_test(Y_test <= 0.5) = 0;
predict_test(Y_test > 0.5) = 1;
Y_test = Y_test - 0.5; % zero-center Y_test

end

