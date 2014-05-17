function d = decode(W_d,b_d,encoded)
	d = tanh(W_d*encoded+b_d);
end

% 
% function d = decode(W_d,b_d,encoded)
%       d = 1./(1+exp(-(W_d*encoded+b_d)));
% end