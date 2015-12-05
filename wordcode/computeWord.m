[dec_word1, prob_word1] = svm_stemmed(word1, Y1, word2, Y2);
word12 = [word1;word2];
Y12 = [Y1;Y2];
% [dec_word2, prob_word2] = svm_stemmed(word12, Y12, word3, Y3);
% word123 = [word1;word2;word3];
% Y123 = [Y1;Y2;Y3];
% N = size(word_test, 1);
% Y_test = zeros(N, 1);
% [dec_word3, prob_word3] = svm_stemmed(word123, Y123, word_test, Y_test);
% save('dec_word', 'dec_word1', 'dec_word2', 'dec_word3');
% save('prob_word', 'prob_word1', 'prob_word2', 'prob_word3');

% [dec_boost_word1, prob_boost_word1] = boosting(word1, Y1, word2);
% [dec_boost_word2, prob_boost_word2] = boosting(word12, Y12, word3);
% [dec_boost_word3, prob_boost_word3] = boosting(word123, Y123, word_test);
% save('dec_boost_word', 'dec_boost_word1', 'dec_boost_word2', 'dec_boost_word3');
% save('prob_boost_word', 'prob_boost_word1', 'prob_boost_word2', 'prob_boost_word3');