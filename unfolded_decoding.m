function decoding_tree =  unfolded_decoding(W_d,b_d,root,encoded,decoding_tree)
    global allSKids;
    if root == size(decoding_tree,2)
        decoding_tree(:,end) = encoded;
    end
	decoded = decode(W_d,b_d,encoded);
	if ((allSKids(root,1)~=0) && (allSKids(root,2)~=0))
		[m,n] = size(decoded);
		left = decoded(1:(m/2));
		right = decoded((m/2+1):end);
        decoding_tree(:,allSKids(root,1)) = left;
        decoding_tree(:,allSKids(root,2)) = right;
		decoding_tree = unfolded_decoding(W_d,b_d,allSKids(root,1),left,decoding_tree);
		decoding_tree = unfolded_decoding(W_d,b_d,allSKids(root,2),right,decoding_tree);
    else
        decoding_tree(:,root) = encoded;  
    end
end