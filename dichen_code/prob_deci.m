addpath('DL_toolbox', 'DL_toolbox/util','DL_toolbox/NN','DL_toolbox/CNN','DL_toolbox/SAE','DL_toolbox/data');

% img_feat_train = importdata('../train/image_features_train.txt');
% img_feat_test = importdata('../test/image_features_test.txt');
% genders_train = importdata('../train/genders_train.txt');
% load('../combination_idx.mat');
close all;

% [prob_img_feat1, deci_img_feat1] = predict_ridge_img_feat( img_feat1, img_feat2, Y1 );
% save('prob_img_feat1.mat', 'prob_img_feat1');
% save('deci_img_feat1.mat', 'deci_img_feat1');
% 
% [prob_img_feat2, deci_img_feat2] = predict_ridge_img_feat( [img_feat1;img_feat2], img_feat3, [Y1;Y2] );
% save('prob_img_feat2.mat', 'prob_img_feat2');
% save('deci_img_feat2.mat', 'deci_img_feat2');
% 
% [prob_img_feat3, deci_img_feat3] = predict_ridge_img_feat( img_feat_train, img_feat_test, genders_train );
% save('prob_img_feat3.mat', 'prob_img_feat3');
% save('deci_img_feat3.mat', 'deci_img_feat3');
% 
% [prob_lasso_word1, deci_lasso_word1] = predict_lasso_word( word1, word2, Y1 );
% save('prob_lasso_word1.mat', 'prob_lasso_word1');
% save('deci_lasso_word1.mat', 'deci_lasso_word1');
% 
% [prob_lasso_word2, deci_lasso_word2] = predict_lasso_word([word1; word2], word3, [Y1;Y2] );
% save('prob_lasso_word2.mat', 'prob_lasso_word2');
% save('deci_lasso_word2.mat', 'deci_lasso_word2');
% 
% [prob_lasso_word3, deci_lasso_word3] = predict_lasso_word( word_train, word_test, genders_train );
% save('prob_lasso_word3.mat', 'prob_lasso_word3');
% save('deci_lasso_word3.mat', 'deci_lasso_word3');

% [ prob_nn_word1 ] = predict_nn_word( word1, word2, Y1 );
% [ prob_nn_word2 ] = predict_nn_word([word1; word2], word3, [Y1;Y2] );
% [ prob_nn_word3 ] = predict_nn_word( word_train(1:4900, :), word_test, genders_train(1:4900, :) ); % training data size must be divisible by 100
% save('prob_nn_word.mat', 'prob_nn_word1', 'prob_nn_word2', 'prob_nn_word3');

[ prob_log_word1, deci_log_word1 ] = predict_log_word( word1, word2, Y1 );
[ prob_log_word2, deci_log_word2 ] = predict_log_word([word1; word2], word3, [Y1;Y2] );
[ prob_log_word3, deci_log_word3 ] = predict_log_word( word_train, word_test, genders_train ); % training data size must be divisible by 100
save('prob_log_word.mat', 'prob_log_word1', 'prob_log_word2', 'prob_log_word3', 'deci_log_word1', 'deci_log_word2', 'deci_log_word3');