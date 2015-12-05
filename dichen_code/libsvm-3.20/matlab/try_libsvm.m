%% libsvm linear kernel
disp('linear');
model = svmtrain(genders_train(1:3000, :).*1, img_feat_train(1:3000, :), '-t 0');
[predicted_label, accuracy, decision_values] = svmpredict(genders_train(3001:4998, :).*1, img_feat_train(3001:4998, :), model);

%% libsvm with other kernels: really bad results
% disp('polynomial');
% model = svmtrain(genders_train(1:3000, :).*1, img_feat_train(1:3000, :), '-t 1');
% [predicted_label, accuracy, decision_values] = svmpredict(genders_train(3001:4998, :).*1, img_feat_train(3001:4998, :), model);
% disp('radial basis function');
% model = svmtrain(genders_train(1:3000, :).*1, img_feat_train(1:3000, :), '-t 2');
% [predicted_label, accuracy, decision_values] = svmpredict(genders_train(3001:4998, :).*1, img_feat_train(3001:4998, :), model);
% disp('sigmoid');
% model = svmtrain(genders_train(1:3000, :).*1, img_feat_train(1:3000, :), '-t 3');
% [predicted_label, accuracy, decision_values] = svmpredict(genders_train(3001:4998, :).*1, img_feat_train(3001:4998, :), model);