function [ W, CV_error ] = trainLasso( X, Y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    [B, FitInfo] = lasso(X, Y, 'CV', 10);
    W = B(:, size(B, 2)); % take the last column
    CV_error = FitInfo.MSE(size(FitInfo.MSE, 2));
end

