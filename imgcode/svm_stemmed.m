function [Ypred_svm, Yprob_svm] = svm_stemmed(Xtrain, Ytrain, Xtest, Ytest, k)
addpath ./libsvm

% k_intersect = @(x,x2) kernel_intersection(x, x2);
% k_gaussian = @(x,x2) kernel_gaussian(x, x2, k);
k_poly = @(x,x2) kernel_poly(x, x2, k);

[test_err info] = kernel_libsvm(Xtrain, Ytrain, Xtest, Ytest, k_poly);% ERROR RATE OF INTERSECTION KERNEL GOES HERE
model = info.model;
Ypred_svm = info.yhat;
Yprob_svm = info.vals;
end


