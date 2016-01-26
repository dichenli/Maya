function [ predication ] = knn_word( Xtrain, Ytrain, Xtest )
    Mdl = fitcknn(Xtrain, Ytrain, 'NumNeighbors', 5);
    predication = predict(Mdl, Xtest);
end

