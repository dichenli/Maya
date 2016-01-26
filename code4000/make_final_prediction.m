function  predictions = make_final_prediction(model, X_test, X_train)
% Input
% X_test : a nxp vector representing "n" test samples with p features.
% X_test=[words images image_features] a n-by-35007 vector
% model : struct, what you initialized from init_model.m
%
% Output
% prediction : a nx1 which is your prediction of the test samples
tic
word_test = X_test(:, 1:5000);
word_test_feat = word_test(:, model.remained_idx);

%% word_svm
[~, ~, prob_word_svm] = word_svm(word_test_feat, model.word_svm_model);

%% word_boosting
[~, prob_word_boosting] = predict(model.word_boost_model, word_test);

%% img_feature

img_feat_test = X_test(:, 35001:35007);

b_ridge = model.img_feature_model.b_ridge;
img_feat_size = size(img_feat_test, 1);
img_feat = [ones(img_feat_size, 1) img_feat_test];
prob_img_feat = img_feat * b_ridge;
prob_img_feat = prob_img_feat - 0.5;

%% img_hog
clearvars img_feat
clearvars img_feat_test
clearvars word_test
[~, ~, prob_hog_img] = img_hog(X_test(:, 5001:35000), model.HOG_train, model.img_hog_model);


%% Combine
feat_train = [-prob_word_svm, prob_word_boosting(:, 2),  prob_hog_img,  prob_img_feat];
combine_lasso = model.combine_lasso;
Blasso = combine_lasso.Blasso;
FitInfo = combine_lasso.FitInfo;
predictions = feat_train * Blasso + FitInfo.Intercept;
predictions(predictions <= 0.5) = 0;
predictions(predictions > 0.5) = 1;
toc
end



