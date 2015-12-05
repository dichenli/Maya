% N = size(img_train, 1);
% [idx1, idx2] = random(N, 1500, 3000);
% [Xtrain, Ytrain] = splitData(img_train, Y_train, idx1);
% [Xtest, Ytest] = splitData(img_train, Y_train, idx2);

idx_img_1 = intersect(idx_1, idx_train);
idx_img_2 = intersect(idx_2, idx_train);
idx_img_3 = intersect(idx_3, idx_train);

% first test: 2000 -> 1500
% Xtrain1 = face_train(idx_img_1, :);
% Ytrain1 = Y_train(idx_img_1, :);
% 
% Xtest1 = face_train(idx_2, :);
% Ytest1 = Y_train(idx_2, :);
% 
% [deci_hog_img1, prob_hog_img1] = image_HOG(Xtrain1, Ytrain1, Xtest1, Ytest1);

% second test: 3500 -> 1500
idx_img_12 = [idx_img_1;idx_img_2];
Xtrain2 = face_train(idx_img_12, :);
Ytrain2 = Y_train(idx_img_12, :);

Xtest2 = face_train(idx_3, :);
Ytest2 = Y_train(idx_3, :);

[deci_hog_img2, prob_hog_img2] = image_HOG(Xtrain2, Ytrain2, Xtest2, Ytest2);

% third test: 5000 -> 5000

% Xtrain3 = face_train(idx_train, :);
% Ytrain3 = Y_train(idx_train, :);
% 
% Xtest3 = face_test;
% Ytest3 = zeros(size(Xtest3, 1), 1);
% [deci_hog_img3, prob_hog_img3] = image_HOG(Xtrain3, Ytrain3, Xtest3, Ytest3);
