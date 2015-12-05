function [Ypred_boosting Yprob_boosting] = boosting(Xtrain, Ytrain, Xtest)
ClassTreeEns = fitensemble(Xtrain,Ytrain,'AdaBoostM1',100,'Tree', 'Holdout', 0.3);

[Ypred_boosting Yprob_boosting] = predict(ClassTreeEns.Trained{1}, Xtest);
end
