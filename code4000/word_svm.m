function [pred_word_svm, acc, prob_word_svm] = word_svm(word_test, word_svm_model)
addpath ./libsvmmod
KtestSize = size(word_test, 1);
Ytest = zeros(KtestSize, 1);
[pred_word_svm, acc, prob_word_svm] = svmpredict(Ytest, word_test, word_svm_model);
end