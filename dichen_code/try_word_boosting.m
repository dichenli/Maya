
accuracy = zeros(5,1);
for learnRate = [0.01 0.1 0.5]
    for Nlearn = [200 500]
        for i = 1:5
        %     i
            [ Xtrain, Xtest, Ytrain, Ytest ] = random_data( word_train, genders_train, 1000, 1000 );
            ClassTreeEns = fitensemble(Xtrain,Ytrain,'LogitBoost',Nlearn, 'Tree', 'Holdout', 0.3, 'LearnRate', learnRate, 'NPrint', 1);
            [Ypred_boosting Yprob_boosting] = predict(ClassTreeEns.Trained{1}, Xtest);
            accuracy(i) = sum(Ypred_boosting == Ytest) / size(Ytest, 1);
            accuracy(i)
        end
        mean(accuracy)
    end
end

% Xtrain,Ytrain,'LogitBoost',200, 'Tree', 'Holdout', 0.3, 'LearnRate', 0.5
% 0.8526

