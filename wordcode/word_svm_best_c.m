addpath ./libsvm;

K = kernel_intersection(word_train, word_train);
save('word_train_kernel.mat', 'K');

crange = 0.01:0.01:0.1;

acc =zeros(numel(crange), 1);
for i = 1:numel(crange)
    fprintf('C = %g\n', crange(i));
    acc(i) = svmtrain(Y, [(1:size(K,1))' K], sprintf('-t 4 -v 5 -c %g', crange(i)));
    acc(i)
end
[~, bestc] = max(acc);
fprintf('Cross-val chose best C = %g\n', crange(bestc));
best = crange(bestc);