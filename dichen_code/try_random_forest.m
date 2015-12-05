close all;

% img_test = importdata('../test/images_test.txt');
% img_feat_test = importdata('../test/image_features_test.txt');
% word_test = importdata('../test/words_test.txt');
% img_train = importdata('../train/images_train.txt');
% img_feat_train = importdata('../train/image_features_train.txt');
% word_train = importdata('../train/words_train.txt');
% genders_train = importdata('../train/genders_train.txt');


%% NumTrees
% accuracy = zeros(5,1);
% for NumTrees = [1 5 50 100 200]
%     InBagFraction = 1;
%     NumTrees
%     for i = 1:5
%     %     i
%         [ Xtrain, Xtest, Ytrain, Ytest ] = random_data( word_train, genders_train, 3500, 1498 );
%         BaggedEnsemble = TreeBagger(NumTrees,Xtrain,Ytrain,'OOBPred','On', 'InBagFraction', InBagFraction, 'NumPrint', 5);
%         % oobErrorBaggedEnsemble = oobError(BaggedEnsemble);
%         % plot(oobErrorBaggedEnsemble)
%         % xlabel 'Number of grown trees';
%         % ylabel 'Out-of-bag classification error';
%         [deci_word_forest, scores] = BaggedEnsemble.predict(Xtest);
%         accuracy(i) = sum(str2num(char(deci_word_forest)) == Ytest) / size(Ytest, 1);
%     %     accuracy(i)
%     end
%     mean(accuracy)
% end
% 

%% InBagFraction
% accuracy = zeros(5,1);
% for InBagFraction = [0.9]
%     InBagFraction
%     NumTrees = 100;
%     for i = 1:5
%     %     i
%         [ Xtrain, Xtest, Ytrain, Ytest ] = random_data( word_train, genders_train, 3500, 1498 );
%         BaggedEnsemble = TreeBagger(NumTrees,Xtrain,Ytrain,'OOBPred','On', 'InBagFraction', InBagFraction, 'NumPrint', 5, 'MaxNumSplits', 7);
%         % oobErrorBaggedEnsemble = oobError(BaggedEnsemble);
%         % plot(oobErrorBaggedEnsemble)
%         % xlabel 'Number of grown trees';
%         % ylabel 'Out-of-bag classification error';
%         [deci_word_forest, scores] = BaggedEnsemble.predict(Xtest);
%         accuracy(i) = sum(str2num(char(deci_word_forest)) == Ytest) / size(Ytest, 1);
%     %     accuracy(i)
%     end
%     mean(accuracy)
% end

%% MaxNumSplits
% accuracy = zeros(5,1);
% NumTrees = 100;
% InBagFraction = 1;
% for MaxNumSplits = [1000 2000]
%     MaxNumSplits
%     for i = 1:5
%     %     i
%         [ Xtrain, Xtest, Ytrain, Ytest ] = random_data( word_train, genders_train, 3500, 1498 );
%         BaggedEnsemble = TreeBagger(NumTrees,Xtrain,Ytrain,'OOBPred','On', 'InBagFraction', InBagFraction, 'NumPrint', 20, 'MaxNumSplits', MaxNumSplits);
%         [deci_word_forest, scores] = BaggedEnsemble.predict(Xtest);
%         accuracy(i) = sum(str2num(char(deci_word_forest)) == Ytest) / size(Ytest, 1);
%         accuracy(i)
%     end
%     mean(accuracy)
% end

%% NumPredictorsToSample
% accuracy = zeros(5,1);
% NumTrees = 100;
% InBagFraction = 1;
% MaxNumSplits = 500;
% for NumPredictorsToSample = [50 71 100 500 1000 2500]
%     NumPredictorsToSample
%     for i = 1:5
%     %     i
%         [ Xtrain, Xtest, Ytrain, Ytest ] = random_data( word_train, genders_train, 3500, 1498 );
%         BaggedEnsemble = TreeBagger(NumTrees,Xtrain,Ytrain,'OOBPred','On', 'InBagFraction', InBagFraction, 'NumPrint', 20, 'MaxNumSplits', MaxNumSplits);
%         % oobErrorBaggedEnsemble = oobError(BaggedEnsemble);
%         % plot(oobErrorBaggedEnsemble)
%         % xlabel 'Number of grown trees';
%         % ylabel 'Out-of-bag classification error';
%         [deci_word_forest, scores] = BaggedEnsemble.predict(Xtest);
%         accuracy(i) = sum(str2num(char(deci_word_forest)) == Ytest) / size(Ytest, 1);
%         accuracy(i)
%     end
%     mean(accuracy)
% end



%% run once
for i = 1:5
%     i
    [ Xtrain, Xtest, Ytrain, Ytest ] = random_data( word_train, genders_train, 3500, 1498 );
    [temp, mu, sigma] = zscore([Xtrain; Xtest]);
    Xtrain = temp(1:3500,:);
    Xtest = temp(3501:4998,:);
    BaggedEnsemble = TreeBagger(NumTrees,Xtrain,Ytrain,'OOBPred','On', 'NumPrint', 20);
    [deci_word_forest, scores] = BaggedEnsemble.predict(Xtest);
    accuracy(i) = sum(str2num(char(deci_word_forest)) == Ytest) / size(Ytest, 1);
    accuracy(i)
end
mean(accuracy)


%% tried numTrees
% NumTrees = 1
% ans = 0.6607
% NumTrees = 5
% ans = 0.7356
% NumTrees = 50
% ans = 0.8130
% NumTrees = 100
% ans = 0.8304
% NumTrees = 200
% ans = 0.8294

% InBagFraction = 1
% ans = 0.8267
% InBagFraction = 0.99
% ans = 0.8219
% InBagFraction = 0.9
% ans = 0.8303
% InBagFraction = 0.7
% ans = 0.8279
% InBagFraction = 0.5
% ans = 0.8178
% InBagFraction = 0.3
% ans = 0.8089
% InBagFraction = 0.1
% ans = 0.7940
% InBagFraction = 0.01
% ans = 0.7089

% MaxNumSplits = 1
% ans = 0.6383
% MaxNumSplits = 7
% ans = 0.7713
% MaxNumSplits = 15
% ans = 0.7832
% MaxNumSplits = 30
% ans = 0.8068
% MaxNumSplits = 50
% ans = 0.8060
% MaxNumSplits = 100
% ans = 0.8092
% MaxNumSplits = 200
% ans = 0.8210
% MaxNumSplits = 500
% ans = 0.8275
% MaxNumSplits = 1000
% ans = 0.8198
% MaxNumSplits = 2000
% ans = 0.8268

% NumPredictorsToSample = 50
% ans = 0.8194
% NumPredictorsToSample = 71
% ans = 0.8340
% NumPredictorsToSample = 100
% ans = 0.8234
% NumPredictorsToSample = 500
% ans = 0.8191

%normalize data by zscore: no effect