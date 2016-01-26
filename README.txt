README

Below are the training models we have tried: 
(word_train are word training data, word_test are word test data, Y_train are labels of train data, etc.)
Please make sure you have all data loaded. 

1. generative method: Naive Bayes to train word
    
    nb_predication = naive_bayes_word(word_train, Y_train, word_test);

2. discriminative method: Logistic Regression to train word

    logistic_predication = logistic_regression(Xtrain, Ytrain, Xtest);
 
3. instance based method: knn regression to train word

    knn_predication = knn_word(Xtrain, Ytrain, Xtest);
 
4. our own regularization method: elastic net to train word

    elasticnet_predication = elastic_net_img_feature(Xtrain, Ytrain, Xtest);
 
5. semi-supervised dimensionality reduction: auto encoder, then use svm to train word

    svm_predication = auto_encoder_svm_word(Xtrain, Ytrain, Xtest);

