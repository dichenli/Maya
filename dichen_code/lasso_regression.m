function [B_lasso Y_test predict] = lasso_regression(Xtrain, Ytrain, Xtest)
train_features = Xtrain;
train_labels = Ytrain;
test_features = Xtest;
% test_labels = Y_train(3501:4998, :);
 
% accuracy_kmeans = k_means(train_features, train_labels, test_features, test_labels, 70);
 
% [B_lasso, FitInfo] = lasso( train_features, train_labels, 'CV', 10); %L1
% figure(1);
% lassoPlot(B_lasso,FitInfo,'PlotType','CV');
 
[B_lasso, FitInfo] = lasso( train_features, train_labels, 'Lambda', 0.001); %0.002 was chosen from above
X_test = test_features;
Y_test = X_test * B_lasso + FitInfo.Intercept;
predict = Y_test;
predict(Y_test <= 0.5) = 0;
predict(Y_test > 0.5) = 1;
% same = predict_test == test_labels;
% accuracy_test_lasso = sum(same, 1) ./ size(test_labels, 1)
% dlmwrite('submit1122_elastic.txt', predict);
end
