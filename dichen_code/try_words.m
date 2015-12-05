% genders_train = importdata('../train/genders_train.txt');
% word_train = importdata('../train/words_train.txt');
% word_test = importdata('../test/words_test.txt');

% word_train1 = word_train(1:3000, :);
% word_train2 = word_train(3001:4998, :);
% genders_train1 = genders_train(1:3000, :);
% genders_train2 = genders_train(3001:4998, :);
% train_size = size(genders_train1, 1);
% test_size = size(genders_train2, 1);

% [b,se,pval,inmodel,stats,nextstep,history] = stepwisefit(word_train1, genders_train1, 'penter', 0.10, 'premove', 0.20);
% Y_test = [ones(test_size,1) word_train2] * [stats.intercept; b];
% prediction = Y_test;
% prediction(Y_test > 0.5) = 1;
% prediction(Y_test <= 0.5) = 0;
% same = prediction == genders_train2;
% accuracy_stepwise = sum(same) / test_size;

% mdl = stepwiselm(word_train1(:, 1:1000), genders_train1, 'Criterion','bic');

% [B_lasso, FitInfo] = lasso( word_train1, genders_train1, 'CV', 10 ); %L1
% figure(1);
% lassoPlot(B_lasso,FitInfo,'PlotType','CV');
% words_lasso_choose_lambda.fig, choose Lambda = 0.01
% [B_lasso, FitInfo] = lasso( word_train1, genders_train1, 'Lambda', 0.01); 
% X_test = word_train2;
% Y_test = X_test * B_lasso + FitInfo.Intercept;
% predict_test = Y_test;
% predict_test(Y_test <= 0.5) = 0;
% predict_test(Y_test > 0.5) = 1;
% same = predict_test == genders_train2;
% accuracy_test_lasso = sum(same, 1) ./ 1998;


