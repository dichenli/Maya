function [ idx_1, idx_2, idx_3 ] = idx_generator3( size_1, size_2, size_3, rand_seed )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    rand('state',rand_seed)
    full_size = size_1 + size_2 + size_3;
    idx = randperm(full_size)';
    idx_1 = idx(1:size_1, :);
    idx_2 = idx(size_1+1:size_1+size_2, :);
    idx_3 = idx(size_1+size_2+1:full_size, :);
end


