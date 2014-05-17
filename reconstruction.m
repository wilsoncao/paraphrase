function reconstruction_tree = reconstruction( W_e, W_d, b_e, b_d, root)
   global allSNum;
   encoding_tree = zeros(100,root);
   encoding_tree = encoding(W_e,b_e,root,encoding_tree);
   reconstruction_tree = get_concat_terminals(root,unfolded_decoding(W_d,b_d,root,encoding_tree(:,end),encoding_tree));

end

