% Ytrain are gender labels
% Xtrain and Xtest are data features.

%% prepare data for word
Xtrain = word_train;
Xtest = word_test;
Ytrain = genders_train;

%% generative method: Naive Bayes
nb_predication = naive_bayes_word(Xtrain, Ytrain, Xtest);
%% discriminative method: Logistic Regression
logistic_predication = logistic_regression_word(Xtrain, Ytrain, Xtest);
%% instance based method: knn regression
knn_predication = knn_word(Xtrain, Ytrain, Xtest);
%% semi-supervised dimensionality reduction: auto encoder, then use svm
svm_predication = auto_encoder_svm_word(Xtrain, Ytrain, Xtest);

%% prepare data for image features
Xtrain = img_feat_train;
Xtest = img_feat_test;
%% our own regularization method: elastic net
elasticnet_predication = elastic_net_img_feature(Xtrain, Ytrain, Xtest);