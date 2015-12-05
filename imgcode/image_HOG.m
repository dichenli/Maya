function [Ypred_svm, Yprob_svm] = image_HOG(Xtrain, Ytrain, Xtest, Ytest)
cell_size = 7;
HOG_train = [];
HOG_test = [];
for i = 1:size(Xtrain,1)
    I = reshape(Xtrain(i, :), [50, 50, 3]);
    % EXTRACT HOG FEATURES (MATLAB PROVIDED)
    [hog_8x8, ~] = extractHOGFeatures(I,'CellSize',[cell_size cell_size]);
    HOG_train = [HOG_train; hog_8x8];
end

for i = 1:size(Xtest,1)
    I = reshape(Xtest(i, :), [50, 50, 3]);
    [hog_8x8, ~] = extractHOGFeatures(I,'CellSize',[cell_size cell_size]);
    HOG_test = [HOG_test; hog_8x8];
end


% [Ypred_svm, Yprob_svm] = svm_stemmed(HOG_train, Ytrain, HOG_test, Ytest);
% sum(Ypred_svm == Ytest)/size(Ytest, 1)
% PARAMETERS NEED TO BE DECIDED AGAIN USING CV
% ANOTHER SET OF PARAMETERS: 9/10 0.05 8
HOG_train = double(HOG_train);
HOG_test = double(HOG_test);
[Ypred_svm, Yprob_svm] = svm_stemmed(HOG_train, Ytrain, HOG_test, Ytest, 1);
correct_ratio = sum(Ypred_svm == Ytest)/size(Ytest, 1)
end

