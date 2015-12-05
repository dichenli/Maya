function [idx_1, idx_2] = random(size, end1, end2)
new_idx = randperm(size, size);
idx_1 = new_idx(1:end1);
start2 = end1+1;
idx_2 = new_idx(start2:end2);
end
