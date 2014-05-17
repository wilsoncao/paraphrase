function [params, info] = Jgrad( params,info,training,wd )

global allSKids;
global allSNum;

[W_e, W_d, b_e, b_d] = stack2param(params,info);

gradW_e = zeros(size(W_e));
gradW_d = zeros(size(W_d));
gradb_e = zeros(size(b_e));
gradb_d = zeros(size(b_d));

for i = 1:10
% for i = 1:size(training.allSNum,2),
    allSKids = training.allSKids{1,i};
    allSNum = training.allSNum{1,i};
    
    root = size(allSKids,1);
    
    [gradW_e_i, gradW_d_i, gradb_e_i, gradb_d_i] = backprop_subtrees(W_e, W_d, b_e, b_d, root);
    gradW_e = gradW_e + gradW_e_i;
    gradW_d = gradW_d + gradW_d_i;
    gradb_e = gradb_e + gradb_e_i;
    gradb_d = gradb_d + gradb_d_i;

end

a = (1.0/size(training.allSNum,2));
grad_J_W_e = a*gradW_e + wd*W_e;
grad_J_W_d = a*gradW_d + wd*W_d;
grad_J_b_e = a*gradb_e;
grad_J_b_d = a*gradb_d;

[params,info] = param2stack(grad_J_W_e,grad_J_W_d,grad_J_b_e,grad_J_b_d);
end