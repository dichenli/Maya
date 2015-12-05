function [Ypred_svm, Yprob_svm] = svm_stemmed(Xtrain, Ytrain, Xtest, Ytest)
addpath ./libsvm

k_intersect = @(x,x2) kernel_intersection(x, x2);

[test_err info] = kernel_libsvm(Xtrain, Ytrain, Xtest, Ytest, k_intersect);% ERROR RATE OF INTERSECTION KERNEL GOES HERE
model = info.model;
Ypred_svm = info.yhat;
Yprob_svm = info.vals;
end


