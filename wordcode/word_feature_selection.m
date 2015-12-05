function [ M_table ] = word_feature_selection( word_train, Y_train )

    loop = 50;
    take = 2000;
%     pick = 2000;

    word_train_new = zscore(word_train);

    for i = 1:loop
        disp(i);
        new_idx = randperm(length(Y_train), length(Y_train));
        idx_1 = new_idx(1:2500);

        word1 = word_train_new(idx_1, :);
        Y1 = Y_train(idx_1);

        model = LinearModel.fit(word1, Y1);
        coeff = model.Coefficients.Estimate;
        [~, delete_Idx] = sort(abs(coeff));
        delete_total(i,:) = delete_Idx(1:take);
    end

    M = tabulate(delete_total(:));
    M_table = sortrows(M,2);
%     M_deleted = M_table(1:pick,1);
%     word_selected = word_train(:, setdiff(1:5000, M_deleted));
end

