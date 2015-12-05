clear; clc
% load 'train_data.mat';
img_test = importdata('../test/images_test.txt');
img_feat_test = importdata('../test/image_features_test.txt');
% word_test = importdata('../test/words_test.txt');
img_train = importdata('../train/images_train.txt');
img_feat_train = importdata('../train/image_features_train.txt');
% word_train = importdata('../train/words_train.txt');
% genders_train = importdata('../train/genders_train.txt');
Y_train = genders_train;

loop = 50;
take = 1500;
pick = 1000;

word_train_new = zscore(word_train);

for i = 1:loop
    new_idx = randperm(length(Y_train), length(Y_train));
    idx_1 = new_idx(1:2500);
        
    word1 = word_train_new(idx_1, :);
    Y1 = Y_train(idx_1);
     
    model = LinearModel.fit(word1, Y1);
    coeff = model.Coefficients.Estimate;
    [~, delete_Idx] = sort(abs(coeff));
    delete_total(i,:) = delete_Idx(1:take);
end

M = tabulate(delete_total(:));
M_table = sortrows(M,2);
M_deleted = M_table(1:pick,1);



