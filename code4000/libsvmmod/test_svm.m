disp('haha');
best_c=-10;
best_g=-10;
best_g = 0;
best_accuracy=0;
for c=-10:10
    for g=0:0%g=-10:10
        libsvm_options=['-t 5 -c ' num2str(2^c) ' -g ' num2str(2^g)];
        model=svmtrain(train_labels, train_points, libsvm_options);
        sprintf('g= %d c =%d',g,c)
        [predict, accuracy]=svmpredict(test_labels, test_points, model);
        if(accuracy(1)>best_accuracy)
            best_c=2^c;
            best_g=2^g;
            best_accuracy=accuracy(1);
        end
    end
end