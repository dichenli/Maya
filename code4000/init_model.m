function model = init_model()

load('word_svm_model.mat');
load('word_boost_model.mat');
load('img_hog_model.mat');
load('img_feature_model.mat');
load('combine_lasso.mat');
load('HOG_train.mat');
load('remained_idx.mat');

model.word_svm_model = word_svm_model;
model.word_boost_model = word_boost_model;
model.img_hog_model = img_hog_model;
model.HOG_train = HOG_train;
model.img_feature_model = img_feature_model;
model.remained_idx = remained_idx;
model.combine_lasso = combine_lasso;


% Example:
% model.svmw = SVM.w;
% model.lrw = LR.w;
% model.classifier_weight = [c_SVM, c_LR];
