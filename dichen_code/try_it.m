% [B, FitInfo] = lasso( word_train, Y_train )

% img_all = [img_train; img_test];
% or
% load('../img_all.mat');
% [coeff,score,latent,tsquared,explained,mu] = pca(img_all);
% X_size = size(img_all, 1);
% img_all_avg = repmat(sum(img_all, 1) / X_size, X_size, 1);
% X_centered = img_all - img_all_avg;
% img_all_pca = X_centered * coeff;
% save('img_all_pca.mat', 'img_all_pca');
% 
% save('pca_coeff.mat', 'coeff'); %each column of coeff is a 9994*1 size vector that is an eigenvector
% save('pca_score.mat', 'score'); %
% save('pca_latent.mat', 'latent'); %latent are the eigenvalues

img_train_pca = score(1:4998, :);
% genders_train = importdata('../train/genders_train.txt');
cv = fitensemble(img_train_pca, genders_train, 'GentleBoost', 10, 'Tree', 'type', 'classification', 'kfold', 5);
figure;
plot(kfoldLoss(cv,'mode','cumulative'),'r.');
xlabel('Number of trees');
ylabel('Classification error');

