function [model] = svm_mod_train(Xtrain, Ytrain)
    addpath ./libsvm-mod

%     fprintf('start');
%     crange = 0.0015:-0.0001:0.0005; % word_svm
%     for i = 1:numel(crange)
%         fprintf('C = %g\n', crange(i));
%         acc(i) = svmtrain(Ytrain, Xtrain, sprintf('-t 5 -v 5 -c %g', crange(i)));
%     end
%     [~, bestc] = max(acc);
    c = 0.0007;
%     fprintf('Cross-val chose best C = %g\n', c);

    model = svmtrain(Ytrain, Xtrain, sprintf('-t 5 -c %g', c));
end


