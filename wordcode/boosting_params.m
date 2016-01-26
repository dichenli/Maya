
tic
ClassTreeEns = fitensemble(word_train, Ytrain, 'LogitBoost', 500, 'Tree', 'Holdout', 0.05, 'LearnRate', 0.3, 'NPrint', 1);
toc
tic
[Ypred_boosting, Yprob_boosting] = predict(ClassTreeEns.Trained{1}, word_test);
toc

% word_train, Ytrain, 'LogitBoost', 600, 'Tree', 'Holdout', 0.05, 'LearnRate', 0.3, 'NPrint', 1
% train time is 377.376750 seconds.
% test time is 85.057658 seconds.
% word_train, Ytrain, 'LogitBoost', 200, 'Tree', 'Holdout', 0.1, 'LearnRate', 0.5, 'NPrint', 1
% train time is 168.030443 seconds.
% test time is 40.247466 seconds.
% word_train, Ytrain, 'LogitBoost', 500, 'Tree', 'Holdout', 0.05, 'LearnRate', 0.3, 'NPrint', 1
% train time is 307.192848 seconds.
% resr time is 71.617901 seconds.