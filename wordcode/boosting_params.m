Xtrain = [word1; word2];

ClassTreeEns = fitensemble(Xtrain,Ytrain,'AdaBoostM1',100,'Tree', 'Holdout', 0.3);
[Ypred_boosting Yprob_boosting] = predict(ClassTreeEns.Trained{1}, Xtest);