function [ predication ] = naive_bayes_word( Xtrain, Ytrain, Xtest )
    modelset = fitcnb(Xtrain,Ytrain,'Distribution', 'mn', 'CrossVal', 'on', 'KFold', 10);
    model = modelset.Trained{1};
    [predication, ~] = predict(model, Xtest);
end

