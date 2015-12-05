k = 100;
[label, model, llh] = emgm(img_feat_train', k);
ratios = zeros(k, 1);
sizes = zeros(k, 1);
for i = 1:k
    cluster = genders_train(label' == i);
    ratios(i) = sum(cluster) / size(cluster, 1);
    sizes(i) = size(cluster, 1);
end
ratios
sizes