function J_sum = Jcheck(theta,info,root,tree)

[W_e,b_e,W_d,b_d] = stack2param(theta,info);
J_sum = J_sub(W_e,W_d,b_e,b_d,root,tree);

end


% 
% function J_sum = Jcheck(theta,info,root,tree)
% 
% [W_e,b_e,W_d,b_d] = stack2param(theta,info);
% 
% encoding_tree = zeros(100,49);
% 
% encoding_tree = encoding(W_e,b_e,root,encoding_tree);
% 
% test = ones(100,1);
% 
% J_sum = 0.5*sum((test - encoding_tree(:,29)).^2);
% 
% end