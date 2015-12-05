addpath('../');
for j = [37 97]
    trial_size = 10;
    results = zeros(trial_size, 1);

    for i = 1:trial_size
    size_1 = 2000;
    size_2 = 1500;
    size_3 = 1498;
    [idx_1, idx_2, idx_3] = idx_generator( size_1, size_2, size_3, i * 647 * j );

    [ word1, img1, img_feat1, Y1 ] = generate_dataset( idx_1, word_train, img_train, img_feat_train, genders_train );
    [ word2, img2, img_feat2, Y2 ] = generate_dataset( idx_2, word_train, img_train, img_feat_train, genders_train );
    [ word3, img3, img_feat3, Y3 ] = generate_dataset( idx_3, word_train, img_train, img_feat_train, genders_train );


    train_x = [word1; word2];
    test_x = word3;
    train_y = [~Y1 Y1 ; ~Y2 Y2];
    test_y = [~Y3 Y3]; % feature 1: male, feature 2: female
    max_size = max(max([word_train; word_test]));
    train_x = double(train_x) / max_size; % to make sure all values are between 0-1 (not sure for what...)
    test_x  = double(test_x)  / max_size; % to make sure all values are between 0-1
    train_y = double(train_y);
    test_y  = double(test_y);

    % normalize
    [train_x, mu, sigma] = zscore(train_x);
    test_x = normalize(test_x, mu, sigma);

    %parameters
    numepochs = 25;
    weightPenaltyL2 = 0.0001;
    hidden_size = 50;
    dropoutFraction = 0.75;


    % begin training
    [ er, bad, loss ] = nn_error( train_x, test_x, train_y, test_y, numepochs, weightPenaltyL2, hidden_size, dropoutFraction );
    results(i) = er;
    end
    avg = mean(results)
end