% a = dir('*.mat')
% for i = 1:length(a)
% load(a(i).name)
% end

% feat_train1 = [prob_word1, prob_boost_word1, prob_lasso_word1, prob_img1, prob_img_feat1, prob_LBP_img1];
% feat_train2 = [prob_word2, prob_boost_word2, prob_lasso_word2, prob_img2, prob_img_feat2, prob_LBP_img2];
% feat_train3 = [prob_word3, prob_boost_word3, prob_lasso_word3, prob_img3, prob_img_feat3, prob_LBP_img3];
% feat_train1 = [-prob_word1, prob_boosting1(:, 2), prob_lasso_word1, nthroot(prob_log_word1, 3), prob_img1, prob_LBP_img1, -prob_img_feat1];
% feat_train2 = [-prob_word2, prob_boosting2(:, 2), prob_lasso_word2, nthroot(prob_log_word2, 3), prob_img2, prob_LBP_img2, -prob_img_feat2];
% feat_train3 = [-prob_word3, prob_boosting3(:, 2), prob_lasso_word3, nthroot(prob_log_word3, 3), prob_img3, prob_LBP_img3, -prob_img_feat3];
feat_train1 = [-prob_word1, prob_boosting1(:, 2), prob_img1, prob_LBP_img1];
feat_train2 = [-prob_word2, prob_boosting2(:, 2), prob_img2, prob_LBP_img2];
feat_train3 = [-prob_word3, prob_boosting3(:, 2), prob_img3, prob_LBP_img3];


correct = compute(feat_train1, feat_train2, Y2, Y3);

% turnin -c cis520 -p leaderboard submit.txt
% remember to change txt file name each time
% finalCompute(feat_train2, feat_train3, Y3, 'submit1202_2.txt');