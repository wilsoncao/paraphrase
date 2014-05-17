function J = J(stack,info,training,wd)
    [W_e,W_d,b_e,b_d] = stack2params(stack,info);
	J_sum = 0.0;
	for i = 1:size(training,2),
        J_sum = J_sum + J_sub(W_e,W_d,b_e,b_d,root,training(i));
    end
    J = (1.0/size(training,2))*J_sum + (wd/2.0)*sum(sum([W_e;W_d'].^2));
end