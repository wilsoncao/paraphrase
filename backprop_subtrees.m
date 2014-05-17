function [gradW_e,gradW_d,gradb_e,gradb_d] = backprop_subtrees(W_e, W_d, b_e, b_d, root)

global allSKids;


gradW_d = zeros(200,100);
gradb_d = zeros(200,1);
gradW_e = zeros(100,200);
gradb_e = zeros(100,1);


for i = 1:root
    if ((allSKids(i,1)~=0) && (allSKids(i,2)~=0))
        
        encoding_tree = zeros(100,i);
        decoding_tree = zeros(100,i);
        
        encoding_tree = encoding(W_e,b_e,i,encoding_tree);
        decoding_tree =  unfolded_decoding(W_d,b_d,i,encoding_tree(:,end),decoding_tree);
        
        grad_W_d_i = zeros(200,100);
        grad_b_d_i = zeros(200,1);
        delta = zeros(100,i);
        
        grad_W_e_i = zeros(100,200);
        grad_b_e_i = zeros(100,1);
        
        
        
        
        [delta ,gradW_d_i ,gradb_d_i] = backprop_d(W_d,decoding_tree,encoding_tree,i,delta,grad_W_d_i,grad_b_d_i);
        [gradW_e_i, gradb_e_i] = backprop_e(W_e,W_d, encoding_tree,i, delta(:,end),grad_W_e_i,grad_b_e_i);
        

        gradW_e = gradW_e + gradW_e_i;
        gradW_d = gradW_d + gradW_d_i;
        gradb_e = gradb_e + gradb_e_i;
        gradb_d = gradb_d + gradb_d_i;
    end
end

end

