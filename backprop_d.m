function [delta ,grad_W_d ,grad_b_d] = backprop_d( W_d,  a_d_tree, a_e_tree ,root,delta,grad_W_d,grad_b_d)
    global allSKids;
	if ((allSKids(root,1)~=0) && (allSKids(root,2)~=0))
        [delta, grad_W_d, grad_b_d] = backprop_d(W_d,a_d_tree,a_e_tree,allSKids(root,1),delta,grad_W_d,grad_b_d);
        [delta, grad_W_d, grad_b_d] = backprop_d(W_d,a_d_tree,a_e_tree,allSKids(root,2),delta,grad_W_d,grad_b_d);
        delta_p = [delta(:,allSKids(root,1));delta(:,allSKids(root,2))];
        grad_W_d = grad_W_d + delta_p * a_d_tree(:,root)';
        grad_b_d = grad_b_d + delta_p;
        delta(:,root) = (W_d'*delta_p).*( 1 - a_d_tree(:,root).^2);
    else
        delta(:,root) = (a_d_tree(:,root) - get_concat_terminals(root,a_e_tree)) .*( 1 - a_d_tree(:,root).^2);
    end
end

