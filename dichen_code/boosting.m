function [Ypred_boosting Yprob_boosting] = boosting(Xtrain, Ytrain, Xtest, )
ClassTreeEns = fitensemble(Xtrain,Ytrain,'LogitBoost',200,'Tree', 'Holdout', 0.3, 'LearnRate', 0.5);
[Ypred_boosting Yprob_boosting] = predict(ClassTreeEns.Trained{1}, Xtest);
end
