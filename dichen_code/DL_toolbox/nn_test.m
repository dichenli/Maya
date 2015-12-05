function [er, bad, prob] = nn_test(nn, x, y)
    [labels, prob] = nn_predict(nn, x);
    [dummy, expected] = max(y,[],2);
    bad = find(labels ~= expected);    
    er = numel(bad) / size(x, 1);
end
