function [Xchoose, Ychoose] = splitData(X, Y, idx)
Xchoose = X(idx, :);
Ychoose = Y(idx, :);
end