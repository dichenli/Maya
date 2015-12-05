addpath('DL_toolbox', 'DL_toolbox/util','DL_toolbox/NN','DL_toolbox/CNN','DL_toolbox/SAE','DL_toolbox/data');
load('../combination_idx.mat');

%% nn on img pca, accuracy about 49%. Useless.
% load('pca_score.mat');
img_pca = score;
img_pca_1 = img_pca(idx_1, :);
img_pca_2 = img_pca(idx_2, :);
img_pca_3 = img_pca(idx_3, :);
Y1 = genders_train(idx_1, :);
Y2 = genders_train(idx_2, :);
Y3 = genders_train(idx_3, :);
Xtrain = [img_pca_1; img_pca_2];
Ytrain = [Y1; Y2];
Xtest = img_pca_3;
Ytest = Y3;

[ prob_nn_img_pca ] = predict_nn_word( Xtrain, Xtest, Ytrain );
histogram(prob_nn_img_pca, 100);

predict_y = prob_nn_img_pca;
predict_y(prob_nn_img_pca <= 0) = 0;
predict_y(prob_nn_img_pca > 0) = 1;
same = predict_y == Ytest;
accuracy = sum(same) / size(Ytest, 1);

%% try image original data, accuracy about 59%
% Xtrain = [img1; img2];
% Ytrain = [Y1; Y2];
% Xtest = img3;
% Ytest = Y3;
% 
% [ prob_nn_img_pca ] = predict_nn_word( Xtrain, Xtest, Ytrain );
% histogram(prob_nn_img_pca, 100);
% 
% predict_y = prob_nn_img_pca;
% predict_y(prob_nn_img_pca <= 0) = 0;
% predict_y(prob_nn_img_pca > 0) = 1;
% same = predict_y == Ytest;
% accuracy = sum(same) / size(Ytest, 1);