function [ prob_nn_word ] = predict_nn_word( train_x, test_x, train_y )
%UNTITLED7 Summary of this function goes here
%   predict word by neural network
addpath('DL_toolbox');
train_y = [~train_y train_y]; % feature 1: male, feature 2: female
train_x = double(train_x); % to make sure all values are between 0-1 (not sure for what...)
test_x  = double(test_x); % to make sure all values are between 0-1
train_y = double(train_y);

% normalize, seems to be the source of randomness?
[train_x, mu, sigma] = zscore(train_x);
test_x = normalize(test_x, mu, sigma);

%parameters
numepochs = 25;
weightPenaltyL2 = 0;
hidden_size = 50;
dropoutFraction = 0.1;
inputZeroMaskedFraction = 0;
learningRate = 0.2;
scaling_learningRate = 0.99;

input_dim = size(train_x, 2);
output_dim = size(train_y, 2);
rand('state',0)

% [5000 = input dimension, 
% 100 = size of hidden layer, 
% 10 = size of output] 
nn = nnsetup([input_dim hidden_size output_dim]); 
nn.weightPenaltyL2 = weightPenaltyL2;  %  L2 weight decay
opts.numepochs =  numepochs;           %  Number of full sweeps through data
opts.batchsize = 100;                  %  Take a mean gradient step over this many samples
nn.dropoutFraction = dropoutFraction;  %  fraction of hidden nodes dropped out, 0 - 1
nn.inputZeroMaskedFraction = inputZeroMaskedFraction;
nn.learningRate = learningRate;
nn.scaling_learningRate = scaling_learningRate;

[nn, loss] = nntrain(nn, train_x, train_y, opts);

[labels, prob_nn_word] = nn_predict(nn, test_x);

end

