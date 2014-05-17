% function [gradW_e,gradb_e] = backprop_e(W_e, a_e_tree,root, delta_p_d)
%   global allSKids;
%   gradW_e = zeros(size(W_e));
%   gradb_e = zeros(size(W_e,1),1);
%   p_deltas = [delta_p_d(:,root)];
%   parent = [root];
%   while (length(parent)>0)
%       new_parents = [];
%       new_p_deltas = [];
%        for i = 1:length(parent)
%            root = parent(i);
%            if ((allSKids(root,1)~=0) && (allSKids(root,2)~=0))
%                delta_p = p_deltas(:,i);
%                left = allSKids(root,1);
%                right = allSKids(root,2);
%                child_concat = [a_e_tree(:,left) ; a_e_tree(:,right)];
%                gradW_e = gradW_e + delta_p * child_concat';
%                gradb_e = gradb_e + delta_p;
%                if ((allSKids(right,1)~=0) && (allSKids(right,2)~=0))
%                    child_concat = [a_e_tree(:,allSKids(right,1)); a_e_tree(:,allSKids(right,2))];
%                end
%                
%                new_parents = [new_parents, left, right];
%                new_p_deltas_concat = (W_e'* delta_p).*(1-child_concat.^2);
%                %new_p_deltas_concat = new_p_deltas_concat + [delta_p;delta_p];
%                
%                new_p_deltas = [new_p_deltas, new_p_deltas_concat(1:100,:), new_p_deltas_concat(101:200,:)];
%            else
%                continue;
%            end
%        end
%        parent = new_parents;
%        p_deltas = new_p_deltas;
%             
%   end
% 
% end
%%


function [gradW_e,gradb_e] = backprop_e(W_e,W_d,a_e_tree,root,delta_p,gradW_e,gradb_e)
    global allSKids;
	if ((allSKids(root,1)~=0) && (allSKids(root,2)~=0))
        
        left_child = allSKids(root,1);
        right_child = allSKids(root,2);
        child_concat = [a_e_tree(:,left_child) ; a_e_tree(:,right_child)];
        gradW_e = gradW_e + delta_p * child_concat';
        gradb_e = gradb_e + delta_p;
        
%         child_concat = [a_e_tree(:,root);a_e_tree(:,root)];
%         
        new_p_deltas_concat = (W_e'* delta_p).*(1-(child_concat.^2));
        
        
		[m,n] = size(new_p_deltas_concat);
		left = new_p_deltas_concat(1:(m/2));
		right = new_p_deltas_concat((m/2+1):end);
		[gradW_e,gradb_e] = backprop_e(W_e,W_d,a_e_tree,allSKids(root,1),left,gradW_e,gradb_e);
        [gradW_e,gradb_e] = backprop_e(W_e,W_d,a_e_tree,allSKids(root,2),right,gradW_e,gradb_e);
    end
end

