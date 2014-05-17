function J = J(stack,info,training,wd)
    global allSKids;
    global allSNum;
    [W_e,W_d,b_e,b_d] = stack2param(stack,info);
	J_sum = 0.0;
	for i = 1:size(training.allSNum,2),
        allSKids = training.allSKids{1,i};
        allSNum = training.allSNum{1,i};
        root = size(allSKids,1);
        encoding_tree = zeros(100,root);
        encoding_tree = encoding(W_e,b_e,root,encoding_tree);
        J_sum = J_sum + J_sub(W_e,W_d,b_e,b_d,root,encoding_tree);
    end
    J = J_sum;
%     J = (1.0/size(training.allSNum,2))*J_sum;% + (wd/2.0)*sum(sum([W_e;W_d'].^2));
end