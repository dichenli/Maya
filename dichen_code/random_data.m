function [ Xtrain, Xtest, Ytrain, Ytest ] = random_data( X, Y, size_train, size_test )
%UNTITLED4 Summary of this function goes here
    % use currect time in second and ms as random seed.
    c = clock;
    [idx_1, idx_2] = idx_generator2(size_train, size_test, round(c(6) * 10000));
    Xtrain = X(idx_1, :);
    Xtest = X(idx_2, :);
    Ytrain = Y(idx_1, :);
    Ytest = Y(idx_2, :);
end

