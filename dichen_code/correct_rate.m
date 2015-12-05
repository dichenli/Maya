function correct = correct_rate(Ypred, Ytest)
correct = sum(Ypred == Ytest)/size(Ytest, 1);
end