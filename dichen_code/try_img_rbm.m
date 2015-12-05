%% restricted Boltzmann machine dimensionality reduction
% I give up early. It's too slow and the reconstruction error does not drop
% epoch 1/50. Average reconstruction error is: 9894.7614
% epoch 2/50. Average reconstruction error is: 9864.5876
% epoch 3/50. Average reconstruction error is: 9860.4951
% epoch 4/50. Average reconstruction error is: 9856.0335
% epoch 5/50. Average reconstruction error is: 9857.8546
% epoch 6/50. Average reconstruction error is: 9860.4097
% epoch 7/50. Average reconstruction error is: 9863.2249
% epoch 8/50. Average reconstruction error is: 9857.2443
% epoch 9/50. Average reconstruction error is: 9863.9061
% epoch 10/50. Average reconstruction error is: 9859.8529
% epoch 11/50. Average reconstruction error is: 9861.4877
% epoch 12/50. Average reconstruction error is: 9859.0637
% Operation terminated by user during rbmtrain (line 18)
addpath('./DL_toolbox/util','./DL_toolbox/NN','./DL_toolbox/DBN');

train_x = [img1; img2];
test_x = img3;
train_y = [~Y1 Y1 ; ~Y2 Y2];
test_y = [~Y3 Y3]; % feature 1: male, feature 2: female

train_x = train_x / 255;
test_x = test_x / 255;

[ dbn ] = rbm( train_x );
[ new_feat, new_feat_test ] = newFeature_rbm( dbn,train_x,test_x );
