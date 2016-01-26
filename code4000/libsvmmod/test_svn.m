load data_svn;
bestcv = 0;
best_a=0;
for log2c = -1:3,
  for log2g = -4:1,
    %cmd = ['-t 5 -v 5 -q -c ', num2str(2^log2c), ' -g ', num2str(2^log2g)];
    cmd = ['-t 5 -q -c ', num2str(2^log2c), ' -g ', num2str(2^log2g)];
    cv = svmtrain(train_labels,train_features, cmd);
    [t,a]=svmpredict(train_labels,train_features,cv);
     if (a >= best_a),
       bestcv = cv; bestc = 2^log2c; bestg = 2^log2g;
     end

%     if (cv >= bestcv),
%       bestcv = cv; bestc = 2^log2c; bestg = 2^log2g;
%     end
    %fprintf('%g %g %g (best c=%g, g=%g, rate=%g)\n', log2c, log2g, cv, bestc, bestg, bestcv);
  end
end
t=svmpredict(train_labels,train_features,bestcv);
