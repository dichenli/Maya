function [ er, bad, loss ] = nn_error( train_x, test_x, train_y, test_y, numepochs, weightPenaltyL2, hidden_size, dropoutFraction, inputZeroMaskedFraction, learningRate, scaling_learningRate )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
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

    [nn loss] = nntrain(nn, train_x, train_y, opts);

    [er, bad] = nntest(nn, test_x, test_y);

end

