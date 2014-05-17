function J_sum = J_sub(W_e,W_d,b_e,b_d,root,tree)
	global allSKids;
	J_sum = 0;

     for i = 1:root,         
        if ((allSKids(i,1)~=0) && (allSKids(i,2)~=0))
            J_sum = J_sum + 0.5*sum(sum((reconstruction(W_e, W_d, b_e, b_d, i)-get_concat_terminals( i , tree )).^2));
        end
     end
end