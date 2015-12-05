function correct = compute(all, mixall, Y1, Y2)
% trains = 2001;
% traine = 3500;
% tests = 3501;
% teste = 4998;

Xtrain = all;
Ytrain = Y1;
Xtest = mixall;
Ytest = Y2;
% predict = lasso_regression(Xtrain, Ytrain, Xtest);
[B_lasso Y_test predict] = lasso_regression(Xtrain, Ytrain, Xtest);
B_lasso
% submit(predict, 'submit1123.txt');
correct = correct_rate(predict, Ytest)
end