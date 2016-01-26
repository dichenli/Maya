
% k_intersect = @(x,x2) kernel_intersection(x, x2);
% k_poly_1 = @(x,x2) kernel_poly(x, x2, 1);
% k_poly_2 = @(x,x2) kernel_poly(x, x2, 2);
% k_poly_3 = @(x,x2) kernel_poly(x, x2, 3);
% k_poly_4 = @(x,x2) kernel_poly(x, x2, 4);
k_gaussian = @(x,x2) kernel_gaussian(x, x2, 1);
k_intersection = @(x,x2) kernel_intersection_1204(x, x2);

% [test_err_poly_1 info] = kernel_libsvm(word12, Y12, word3, Y3, k_poly_1);
% [test_err_poly_2 info] = kernel_libsvm(word12, Y12, word3, Y3, k_poly_2);
% [test_err_poly_3 info] = kernel_libsvm(word12, Y12, word3, Y3, k_poly_3);
% [test_err_poly_4 info] = kernel_libsvm(word12, Y12, word3, Y3, k_poly_4);
% [test_err_gaussian info] = kernel_libsvm(word12, Y12, word3, Y3, k_gaussian);
[test_err_intersection info] = kernel_libsvm(word12, Y12, word3, Y3, k_intersection);