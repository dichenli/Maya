function [ predication ] = auto_encoder_svm_word( Xtrain, Ytrain, Xtest )
    % auto-encoder
    autoenc = trainAutoencoder(Xtrain', 'MaxEpochs', 500);
    % generate new feature
    Xtrain_feat = predict(autoenc, Xtrain')';
    Xtest_feat = predict(autoenc, Xtest')';

    % use svm model to train new feature generated by auto-encoder
    SVM_model = fitcsvm(Xtrain_feat, Ytrain, 'kernelfunction', 'linear',...
        'outlierfraction', 0.05, 'KFold', 8);

    [predication, ~] = predict(SVM_model.Trained{1}, Xtest_feat);
end
