Xtrain = face_train(1:3500, :);
Ytrain = Y_train(1:3500, :);
Xtest = face_train(3501:end, :);
Ytest = Y_train(3501:end, :);

[Ypred_svm, Yprob_svm] = svm_stemmed(Xtrain, Ytrain, Xtest, Ytest);
sum(Ypred_svm == Ytest)/size(Ytest, 1)