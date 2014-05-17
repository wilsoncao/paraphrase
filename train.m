%%Training the whole W_e and W_d

global We2;

load('../data/msrp_train_binarized_unq.100.mat');
load('../data/vars.normalized.100.mat');

W_d = randn(200,100);
W_e = randn(100,200);
b_d = randn(200,1);
b_e = randn(100,1);

[theta info ] =param2stack(W_e,W_d,b_e,b_d);

addpath minFun/

options.Method = 'lbfgs'; % Here, we use L-BFGS to optimize our cost
                          % function. Generally, for minFunc to work, you
                          % need a function pointer with two outputs: the
                          % function value and the gradient. In our problem,
                          % sparseAutoencoderCost.m satisfies this.
options.maxIter = 400;	  % Maximum number of iterations of L-BFGS to run 
options.display = 'on';


[opttheta, cost] = minFunc( @(p) Recursive_autoencoder_cost(theta,info,test,0.1), theta, options);

