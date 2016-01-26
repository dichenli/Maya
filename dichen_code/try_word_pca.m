close all;
addpath('glmnet_matlab');

%% calculate PCA
% [word_coeff,word_score,word_latent,tsquared,explained,mu] = pca([word_train; word_test]);
% save('pca_word.mat', 'word_coeff', 'word_score', 'word_latent'); 

% Warning: Columns of X are linearly dependent to within machine
% precision.
% Using only the first 4755 components to compute TSQUARED. 
% > In pca>localTSquared (line 501)
%   In pca (line 347)
%   In try_word_pca (line 1) 

% figure(1);
% plot(word_latent);

%% generate datasets
load('../combination_idx.mat');
load('pca_word.mat');
word_train = word_score([idx_1; idx_2], :);
word_test = word_score(idx_3, :);
Ytrain = genders_train([idx_1; idx_2], :);
Ytest = genders_train(idx_3, :);
test_size = size(Ytest, 1);

for dim = [3000]
    Xtrain = word_train(:, 1:dim);
    Xtest = word_test(:, 1:dim);
    options = glmnetSet;
    cvfit = cvglmnet(Xtrain, Ytrain, 'binomial', options, 'class');

    % accuracy
    cvPred = cvglmnetPredict(cvfit, Xtest, 'lambda_min', 'class');
    same = cvPred == Ytest;
    accuracy_log_word = sum(same) / test_size;
    dim
    accuracy_log_word
end

% dim =
% 
%     50
% 
% 
% accuracy_log_word =
% 
%     0.8064
% 
% 
% dim =
% 
%    100
% 
% 
% accuracy_log_word =
% 
%     0.8251
% 
% 
% dim =
% 
%    250
% 
% 
% accuracy_log_word =
% 
%     0.8411
%     
%
% dim =
% 
%    400
% 
% 
% accuracy_log_word =
% 
%     0.8445
% 
% 
% dim =
% 
%    500
% 
% 
% accuracy_log_word =
% 
%     0.8431
% 
% Warning: from glmnet Fortran code (error code -98); Convergence for 98th
% lambda value not reached after maxit=100000 iterations; solutions for larger
% lambdas returned 
% > In lognet (line 78)
%   In glmnet (line 446)
%   In cvglmnet (line 324)
%   In try_word_pca (line 30) 
% Warning: from glmnet Fortran code (error code -87); Convergence for
% 87th lambda value not reached after maxit=100000 iterations; solutions
% for larger lambdas returned 
% > In lognet (line 78)
%   In glmnet (line 446)
%   In cvglmnet (line 324)
%   In try_word_pca (line 30) 
% 
% dim =
% 
%         1000
% 
% 
% accuracy_log_word =
% 
%     0.8304
% 
% 
% dim =
% 
%         2500
% 
% 
% accuracy_log_word =
% 
%     0.8091
% 
% 
% dim =
% 
%         4000
% 
% 
% accuracy_log_word =
% 
%     0.7850
% 
% 
% dim =
% 
%         5000
% 
% 
% accuracy_log_word =
% 
%     0.7737