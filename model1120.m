clear; clc
%% Load data
% img_train = importdata('./train/images_train.txt');
% img_feat_train = importdata('./train/image_features_train.txt');
% word_train = importdata('./train/words_train.txt');
% 
% Y_train = importdata('./train/genders_train.txt');

load 'train_data';

%% Stepwise Regression
step_model = stepwisefit(word_train(1:3000, :), Y_train(1:3000));