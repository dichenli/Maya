  
  2.1 
  Testing error for vanilla neural network: 
      0.0477
  Testing error for neural network with L2 weight decay: 
      0.0353
  The nn with L2 weight decay has lower testing error.
  Lower error is achieved because the original one overfits training data.
  
  2.2
  Testing error of nn with  L2 weight decay parameters 0.001:
  0.0521
  Testing error of nn with  L2 weight decay parameters 0.01:
  0.1149
  The one with weight decay parameters 0.001 performs better. The one with
  0.0001 performs even better. This is caused by underfitting.
  
  2.3
  Testing error with dropout parameter 25 : 0.0429
  Testing error with dropout parameter 75 : 0.0691
  25  dropout has best performance. 75  has removed too many useful neurons
  (underfitting). The dropout helps to reduce error rate.
  
  2.4
  Testing error with hidden layer size 100: 0.0477
  Testing error with hidden layer size 25:  0.0583
  Testing error with hidden layer size 175: 0.0416
  The one with 175 size has best performance. Because it has tried more possible features. But it's slower.
