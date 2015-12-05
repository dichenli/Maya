% FEATURE: IMAGE FEATURE
% METHOD: SVMSTEMMED(HW6 PROVIDED) 
% TAKE CARE OF DIFFERENT C IN KERNEL_LIBSVM HERE!!!!

Xtrain = img_feat1; 
Ytrain = Y1;
Xtest  = img_feat2;
Ytest  = Y2;
% FOR THE LAST SET WITHOUT RESULT, USING
% Ytest  = zeros(size(Xtest,1),1);

% USE A DIFFERENT C HERE IN KERNEL_LIBSVM, DIFFERENT FROM WORD SVM!!!
% STILL UNDECIDED! NEED TEST
% RIGHT NOW: crange = 0.0004:0.0001:0.0025; (VERY VERY UNSTEADY RIGHT NOW)
[Ypred, Yprob] = svm_stemmed(Xtrain, Ytrain, Xtest, Ytest);

% OUTPUT CORRECT RATIO OF TRAINING SET
% IGNORE THIS VALUE FOR THE TEST GROUP
correct_ratio = length(find(Ypred == Ytest))/length(Ytest)

% REMEMBER TO CHANGE VARIABLE NAME BEFORE SAVE!
prob_SVM_feat1 = Yprob;
deci_SVM_feat1 = Ypred;
% save 'feat_SVM_1.mat' prob_SVM_feat1 deci_SVM_feat1 -v7.3