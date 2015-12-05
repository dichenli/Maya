% choose one of two lines below
% load('temp.mat');
b = prob_nn_word;

close all;
prob_nn = 1 - b; % prob_nn smaller value: more likely to be male
y = Y3;
figure(1);
hold on;
histogram(prob_nn(y == 0) - 0.5, 100);
histogram(prob_nn(y == 1) - 0.5, 100);
hold off;

% figure(2);
% a = tanh(prob_nn(y == 0) - 0.5);
% b = tanh(prob_nn(y == 1) - 0.5);
% hold on;
% histogram(a, 100);
% histogram(b, 100);
% hold off;

