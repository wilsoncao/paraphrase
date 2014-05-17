function [params,info] = Jgrad( params,info,training,wd )

[W_e, W_d, b_e, b_d] = stack2params(params,info);

gradW_e = zeros(size(W_e));
gradW_d = zeros(size(W_d));
gradb_e = zeros(size(b_e));
gradb_d = zeros(size(b_d));


for i = 1:size(training,1),
    tree = training(i);
    [gradW_e_i, gradW_d_i, gradb_e_i, gradb_d_i] = backprop_subtrees(W_e, W_d, b_e, b_d, tree);
    gradW_e = gradW_e + gradW_e_i;
    gradW_d = gradW_d + gradW_d_i;
    gradb_e = gradb_e + gradb_e_i;
    gradb_d = gradb_d + gradb_d_i;

end

a = 1.0/len(training);
grad_J_W_e = a*gradW_e + wd*W_e;
grad_J_W_d = a*gradW_d + wd*W_d;
grad_J_b_e = a*gradb_e;
grad_J_b_d = a*gradb_d;

[params,info] = params2stack(grad_J_W_e,grad_J_W_d,grad_J_b_e,grad_J_b_d);
end