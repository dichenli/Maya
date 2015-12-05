% IMAGE FEATURES. METHOD: ONLY HOG & SVM (BOTH MATLAB PROVIDED)
clear; clc
load 'random_data.mat';

Xtrain = img1; 
Ytrain = Y1;
Xtest  = img2;
Ytest  = Y2;
% USING Ytest = zeros(size(Xtest,1),1); FOR THE LAST SET WITHOUT RESULT

HOG_train = [];
HOG_test = [];

for i = 1:size(Xtrain,1)
    I = reshape(Xtrain(i, :), [100, 100, 3]);
    % EXTRACT HOG FEATURES (MATLAB PROVIDED)
    [hog_16x16, ~] = extractHOGFeatures(I,'CellSize',[16 16]);
    HOG_train = [HOG_train; hog_16x16];
end

for i = 1:size(Xtest,1)
    I = reshape(Xtest(i, :), [100, 100, 3]);
    [hog_16x16, ~] = extractHOGFeatures(I,'CellSize',[16 16]);
    HOG_test = [HOG_test; hog_16x16];
end

% PARAMETERS NEED TO BE DECIDED AGAIN USING CV
% ANOTHER SET OF PARAMETERS: 9/10 0.05 8
SVM_model = fitcsvm(HOG_train, Ytrain, 'kernelfunction', 'polynomial',...
    'polynomialorder', 9, 'outlierfraction', 0.02, 'KFold', 10);

[deci, prob] = predict(SVM_model.Trained{1}, HOG_test);
prob = double(prob(:, 2));
% OUTPUT CORRECT RATIO OF TRAINING SET
% IGNORE THIS VALUE FOR THE TEST GROUP
correct_ratio = length(find(deci == Ytest))/length(deci)

% REMEMBER TO CHANGE VARIABLE NAME BEFORE SAVE!
prob_HOG_img1 = prob;
deci_HOG_img1 = deci;
save 'prob_HOG_img1.mat' prob_HOG_img1 deci_HOG_img1 -v7.3
