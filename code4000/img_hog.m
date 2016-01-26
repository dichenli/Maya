function [pred_hog_img, acc, prob_hog_img] = img_hog(img_test, HOG_train, img_hog_model)
addpath ./libsvm
face_test = face_detect(img_test);
faceTestSize = size(face_test, 1);
cell_size = 7;
hog_size = 1296;
HOG_test = zeros(faceTestSize, hog_size);
Ytest = zeros(faceTestSize, 1);
for i = 1:faceTestSize
    I = reshape(face_test(i, :), [50, 50, 3]);
    [hog_8x8, ~] = extractHOGFeatures(I,'CellSize',[cell_size cell_size]);
    HOG_test(i, :) = double(hog_8x8);
end
Khogtest = kernel_poly(HOG_train, HOG_test, 10);
KhogtestSize = size(Khogtest, 1);
[pred_hog_img, acc, prob_hog_img] = svmpredict(Ytest, [(1:KhogtestSize)' Khogtest], img_hog_model);
end