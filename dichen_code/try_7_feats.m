% img_feat_train = importdata('../train/image_features_train.txt');
% img_feat_test = importdata('../test/image_features_test.txt');
% genders_train = importdata('../train/genders_train.txt');

close all;

%% choose the best lambda for lasso
% [B_lasso, FitInfo] = lasso( img_feat_train, genders_train, 'CV', 10, 'Alpha', 0.5 ); %L1
% figure(1);
% lassoPlot(B_lasso,FitInfo,'PlotType','CV');

[B_lasso, FitInfo] = lasso( img_feat1, Y1, 'Lambda', 0.002, 'alpha', 0.5); %0.002 was chosen from above
X_test = img_feat2;
Y_test = X_test * B_lasso + FitInfo.Intercept;
predict_test = Y_test;
predict_test(Y_test <= 0.5) = 0;
predict_test(Y_test > 0.5) = 1;
same = predict_test == Y2;
accuracy_test_lasso = sum(same, 1) ./ size(Y2, 1);

%% use regress, not done
% b = regress(genders_train(1:3000, :), img_feat_train(1:3000, :));
% predict = img_feat_train(3001:4998, :) * b;
% predict(predict > 0.5) = 1;
% predict(predict <= 0.5) = 0;

%% use ridge, 70.12%
% k = 304;
% b_ridge = ridge(genders_train(1:3000, :), img_feat_train(1:3000, :), k, 0);
% X_test = [ones(1998, 1) img_feat_train(3001:4998, :)];
% Y_test = X_test * b_ridge;
% predict_test = Y_test;
% predict_test(Y_test <= 0.5) = 0;
% predict_test(Y_test > 0.5) = 1;
% real_test = repmat(genders_train(3001:4998, :), 1, size(k, 2));
% same = predict_test == real_test;
% Y_test_diff = Y_test(~same);
% Y_test_same = Y_test(same);
% Y_test_male = Y_test(genders_train(3001:4998, :) == 0);
% Y_test_female = Y_test(genders_train(3001:4998, :) == 1);
% figure(1);
% histogram(Y_test_same);
% figure(2);
% histogram(Y_test_diff);
% figure(3);
% hold on;
% histogram(Y_test_diff);
% histogram(Y_test);
% histogram(Y_test);
% hold off;
% figure(4);
% hold on;
% histogram(Y_test_male);
% histogram(Y_test_female);
% hold off;
% accuracy_test_ridge = sum(same, 1) ./ 1998;
% 
% accuracy_distribution_ridge = zeros(1, 21);
% j = 1;
% for i = 0:0.05:1
%     all = size(Y_test(logical((Y_test <= i + 0.05).* (Y_test > i))),1);
%     wrong = size(Y_test_diff(logical((Y_test_diff <= i + 0.05).* (Y_test_diff > i))),1);
%     if (all ~= 0)
%         accuracy_distribution_ridge(j) = wrong / all;
%     end
%     j = j + 1;
% end
% figure(5); 
% plot(0:0.05:1, accuracy_distribution_ridge);
% xlabel('regression predicted value');
% ylabel('error rate');

% img_feat_set1_prob = Y_test;
% img_feat_set1_deci = predict_test;
% save('img_feat_set1_prob.mat', 'img_feat_set1_prob');
% save('img_feat_set1_deci.mat', 'img_feat_set1_deci');
% 
%% use logistic regression, 70.12%
% [B_log,dev,stats] = mnrfit(img_feat_train(1:3000, :), genders_train(1:3000, :) + 1);
% X_train = [ones(3000, 1) img_feat_train(1:3000, :)];
% predict_train = exp(X_train * B);
% predict_train(predict_train <= 1) = 1;
% predict_train(predict_train > 1) = 0;
% diff = predict_train ~= genders_train(1:3000, :);
% accuracy_train = size(diff(diff == 0), 1) / 3000;

% X_test = [ones(1998, 1) img_feat_train(3001:4998, :)];
% Y_test = exp(X_test * B_log);
% predict_test = Y_test;
% predict_test(Y_test <= 1) = 1;
% predict_test(Y_test > 1) = 0;
% diff = predict_test ~= genders_train(3001:4998, :);
% Y_test_diff = Y_test(diff);
% Y_test_same = Y_test(~diff);
% figure(4);
% histogram(Y_test_same);
% figure(5);
% histogram(Y_test_diff);
% figure(6);
% histogram(Y_test);
% accuracy_test_logistic = size(diff(diff == 0), 1) / 1998;

%% kmeans
% accuracy_kmeans = k_means(img_feat_train(1:3000, :), genders_train(1:3000, :), img_feat_train(3001:4998, :), genders_train(3001:4998, :), 100);





