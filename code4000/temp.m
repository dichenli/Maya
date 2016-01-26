model = init_model();
predictions = make_final_prediction(model, [word3 img3 img_feat3], [word1 img1 img_feat1; word2 img2 img_feat2]);
accuracy = mean(predictions == Y3);