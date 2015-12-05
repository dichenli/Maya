% nn_words_results = csvread('/Users/dichenli/Documents/cis520/project/nn_words_results.csv', 2, 0);
weightPenaltyL2s = [0.01 0.001 0.0001 0];
hidden_sizes = [25 50 100 150 200];
dropoutFractions = [0 0.1 0.25 0.5 0.75];

close all;
figure(1);
hold on;
for hidden_size = hidden_sizes
    for dropoutFraction = dropoutFractions
        select = nn_words_results(nn_words_results(:, 3) == hidden_size, :);
        select = select(select(:, 4) == dropoutFraction, :);
        plot(log(select(:, 2) + 0.00001), select(:, 5));
    end
end
hold off;

figure(2);
hold on;
for weightPenaltyL2 = weightPenaltyL2s
    for dropoutFraction = dropoutFractions
        select = nn_words_results(nn_words_results(:, 2) == weightPenaltyL2, :);
        select = select(select(:, 4) == dropoutFraction, :);
        plot(select(:, 3), select(:, 5));
    end
end
hold off;
