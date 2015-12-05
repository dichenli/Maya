addpath('DL_toolbox', 'DL_toolbox/util','DL_toolbox/NN','DL_toolbox/CNN','DL_toolbox/SAE','DL_toolbox/data');
train_x = [word1; word2];
test_x = word3;
train_y = [Y1; Y2];
test_y = Y3(uncertain_idx);
[ prob_nn_word ] = predict_nn_word( [word1; word2], word3, [Y1; Y2] );
histogram(atanh(prob_nn_word), 100);

predict_y = prob_nn_word(uncertain_idx);
predict_y(prob_nn_word(uncertain_idx) < 0) = 0;
predict_y(prob_nn_word(uncertain_idx) > 0) = 1;
same = predict_y == test_y;
accuracy = sum(same) / size(test_y, 1);

