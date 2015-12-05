function [ word_train_set, img_train_set, img_feat_train_set, genders_train_set ] = generate_dataset( idx, word_train, img_train, img_feat_train, genders_train )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    word_train_set = word_train(idx, :);
    img_train_set = img_train(idx, :);
    img_feat_train_set = img_feat_train(idx, :);
    genders_train_set = genders_train(idx, :);
end

