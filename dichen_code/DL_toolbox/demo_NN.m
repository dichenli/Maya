%% run NN on words
addpath('util','NN','CNN','SAE','data');

% prepare data
% genders_train = importdata('../../train/genders_train.txt');
% word_train = importdata('../../train/words_train.txt');
% word_test = importdata('../../test/words_test.txt');

train_x = [word1; word2];
test_x = word3;
train_y = [~Y1 Y1 ; ~Y2 Y2];
test_y = [~Y3 Y3]; % feature 1: male, feature 2: female
max_size = max(max([word_train; word_test]));
train_x = double(train_x); % to make sure all values are between 0-1 (not sure for what...)
test_x  = double(test_x); % to make sure all values are between 0-1
train_y = double(train_y);
test_y  = double(test_y);

% normalize
noodle = reshape(train_x, [size(train_x,1) * size(train_x,2), 1]);
[noodle, mu, sigma] = zscore(noodle);
train_x = reshape(noodle, [size(train_x,1), size(train_x,2)]);
test_x = normalize(test_x, mu, sigma);

% [dummy, mu, sigma] = zscore(train_x);
% sigma = ones(1, 5000) * max(sigma);
% train_x = normalize(train_x, mu, sigma);
% test_x = normalize(test_x, mu, sigma);

%parameters
numepochss = [100];
weightPenaltyL2s = [0.00001 0.0001 0.001];
hidden_sizes = [25 50 100 200];
dropoutFractions = [0 0.15 0.3];
inputZeroMaskedFractions = 0;
learningRates = [0.2 0.3 0.4 0.5];
scaling_learningRates = [0.99];
matrix_size = size(numepochss, 2) * size(weightPenaltyL2s, 2) * size(hidden_sizes, 2) * size(dropoutFractions, 2) * size(inputZeroMaskedFractions, 2) * size(learningRates, 2) * size(scaling_learningRates, 2);


% begin training
nn_words_results = zeros(matrix_size, 8);
j = 1;
for numepochs = numepochss
    for weightPenaltyL2 = weightPenaltyL2s
        for hidden_size = hidden_sizes
            for dropoutFraction = dropoutFractions
                for inputZeroMaskedFraction = inputZeroMaskedFractions
                    for learningRate = learningRates
                        for scaling_learningRate = scaling_learningRates
                            rand('state', j * 31)
                            [ er, bad, loss ] = nn_error( train_x, test_x, train_y, test_y, numepochs, weightPenaltyL2, hidden_size, dropoutFraction, inputZeroMaskedFraction, learningRate, scaling_learningRate );
                            disp(j);
                            disp(er);
                            nn_words_results(j, :) = [numepochs, weightPenaltyL2, hidden_size, dropoutFraction, inputZeroMaskedFraction, learningRate, scaling_learningRate, er];
                            j = j + 1;
                        end
                    end
                end
            end
        end
    end
end
% disp('numepochs, weightPenaltyL2, hidden_size, dropoutFraction, matrix_size, er, bad, loss');
save('nn_words_results.mat', 'nn_words_results');
nn_words_results

% for i = 1:10
%     [ er, bad, loss ] = nn_error( train_x, test_x, train_y, test_y, 10, 0.001, 50, 0.5 ); 
%     disp(er);
% end


