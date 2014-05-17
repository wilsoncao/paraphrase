function encoding_tree = encoding(W_e,b_e,root,encoding_tree)
    global allSKids;
    global allSNum;
    global We2;
    if ((allSKids(root,1)~=0) && (allSKids(root,2)~=0))
        encoding_tree = encoding(W_e,b_e,allSKids(root,1),encoding_tree);
        encoding_tree = encoding(W_e,b_e,allSKids(root,2),encoding_tree);
        x_concat = [encoding_tree(:,allSKids(root,1));encoding_tree(:,allSKids(root,2))];
        encoded = encode(W_e,b_e,x_concat);
        encoding_tree(:,root) = encoded;
	else
		node = We2(:,allSNum(root));
		encoding_tree (:,root) = node;
    end
end


