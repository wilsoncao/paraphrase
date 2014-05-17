function [gradW_d,gradb_d] = sum_all_grad_d(root,tree_gradW_d,tree_gradb_d)
	global allSKids;
	grads = [];
	if ((allSKids(root,1)~=0) && (allSKids(root,2)~=0))
		grads = [grads,sum_all_grad_d(root)];
		gradW_d = tree_gradW_d+sum(grads);
		gradb_d = tree_gradb_d+sum(grads);
	else
		gradW_d = tree_gradW_d;
		gradb_d = tree_gradb_d;
    end
end