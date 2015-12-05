max_accuracy = 0;
max_accuracy_k = 0;
accuracy_EM = zeros(20, 1);
j = 1;
for k = 2:5:100
    [cluster, model, llh] = emgm([train_features; test_features]', k);
    ratios = zeros(k, 1);
    sizes = zeros(k, 1);
    map = zeros(k, 1);
    train_size = size(train_features, 1);
    test_size = size(test_features, 1);
    predict = zeros(size(test_labels,1), 1);
    cluster_train = cluster(:, 1:train_size)';
    cluster_test = cluster(:, train_size+1:train_size+test_size)';
    for i = 1:k
        cluster_labels = train_labels(cluster_train == i); % the 0/1 labels of the points assigned to cluster i
        ratios(i) = sum(cluster_labels) / size(cluster_labels, 1);
        sizes(i) = size(cluster_labels, 1);
        if ratios(i) > 0.5
            map(i) = 1;
        else
            map(i) = 0;
        end
        predict(cluster_test == i) = map(i);
    end
    % for i = 1:test_size
    %     predict(i) = map(cluster_test(i));
    % end

    same = predict == test_labels;
    accuracy_EM(j) = sum(same) / (test_size);
    if accuracy_EM(j) > max_accuracy
        max_accuracy = accuracy_EM;
        max_accuracy_k = k;
    end
    j = j + 1;
end