close all;
addpath('cartree', 'cartree/mx_files', 'ancillary');
addpath('../');

% img_test = importdata('../../test/images_test.txt');
% img_feat_test = importdata('../../test/image_features_test.txt');
% word_test = importdata('../../test/words_test.txt');
% img_train = importdata('../../train/images_train.txt');
% img_feat_train = importdata('../../train/image_features_train.txt');
% word_train = importdata('../../train/words_train.txt');
% genders_train = importdata('../../train/genders_train.txt');
accuracy = zeros(5,1);

%% http://www.mathworks.com/matlabcentral/fileexchange/31036-random-forest

for i = 1:1
    [ Xtrain, Xtest, Ytrain, Ytest ] = random_data( word_train, genders_train, 3500, 1498 );
    Random_Forest = Stochastic_Bosque(Xtrain, Ytrain);
    [f_output f_votes]= eval_Stochastic_Bosque(Xtrain,Random_Forest);
    accuracy(i) = 0;% TODO
end
mean(accuracy)