% cvfit = cvglmnet(img_feat_train, genders_train);
% cvglmnetPlot(cvfit);
fit1 = glmnet(img_feat_train(1:3000, :), genders_train(1:3000, :));
coeff = glmnetPredict(fit1,[],0.01,'coef');
predict = glmnetPredict(fit1, img_feat_train(3001:4998, :), 0.0000001);
predict(predict <= 0.5) = 0;
predict(predict > 0.5) = 1;
same = predict == genders_train(3001:4998, :);
accuracy_glmnet = sum(same) / 1998;