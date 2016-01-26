% For your convenience
img_test = importdata('../test/images_test.txt');
img_feat_test = importdata('../test/image_features_test.txt');
word_test = importdata('../test/words_test.txt');
img_train = importdata('../train/images_train.txt');
img_feat_train = importdata('../train/image_features_train.txt');
word_train = importdata('../train/words_train.txt');
genders_train = importdata('../train/genders_train.txt');

load('../combination_idx.mat');

[ word1, img1, img_feat1, Y1 ] = generate_dataset( idx_1, word_train, img_train, img_feat_train, genders_train );
[ word2, img2, img_feat2, Y2 ] = generate_dataset( idx_2, word_train, img_train, img_feat_train, genders_train );
[ word3, img3, img_feat3, Y3 ] = generate_dataset( idx_3, word_train, img_train, img_feat_train, genders_train );
Y12 = [Y1;Y2];
Y123 = [Y1;Y2;Y3];
word12 = [word1;word2];
word123 = [word1;word2;word3];