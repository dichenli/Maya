function finalCompute(all, mixall, Y_train, filename)
Xtrain = all;
Ytrain = Y_train;
Xtest = mixall;

[B_lasso Y_test predict] = lasso_regression(Xtrain, Ytrain, Xtest);
submit(predict, filename);
end