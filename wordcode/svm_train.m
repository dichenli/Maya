function [ model ] = svm_train( X, Y, kernel )
%copy code from svm_stemmed, but only generate training model
%   
    
    % Compute kernel matrices for training and testing.
    K = kernel(X, X);
%     Ktest = kernel(X, Xtest);

    % Use built-in libsvm cross validation to choose the C regularization
    % parameter.
    % crange = 10.^[-10:2:3];
    crange = 0.0015:-0.0001:0.0005; % word_svm
    % crange = 0.8:0.01:0.9;
    % crange = 0.003:0.0001:0.004;
    fprintf('start');
    for i = 1:numel(crange)
        fprintf('C = %g\n', crange(i));
        acc(i) = svmtrain(Y, [(1:size(K,1))' K], sprintf('-t 4 -v 5 -c %g', crange(i)));
    end
    [~, bestc] = max(acc);
    fprintf('Cross-val chose best C = %g\n', crange(bestc));

    % Train and evaluate SVM classifier using libsvm
    model = svmtrain(Y, [(1:size(K,1))' K], sprintf('-t 4 -c %g', crange(bestc)));
    fprintf('finish create model\n');

end

