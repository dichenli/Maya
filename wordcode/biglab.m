% load('img_data.mat');
% load('img_feat_data.mat');
% load('word_train.mat');   
% load('word_test.mat'); 
% load('genders.mat');
% Xtrain = [word_train img_train img_feat_train];
% Xtest = [word_test img_test img_feat_test];
% save('Xtrain.mat', 'Xtrain');
% save('Xtest.mat', 'Xtest');

load('Xtest3.mat');
load('Xtrain3.mat');
tic
model = init_model();
toc
tic
predictions = make_final_prediction(model, Xtest, Xtrain); %where XTest and XTrain are [words images image_features]
toc
