function f = encode(W_e,b_e,x)
	f = tanh(W_e*x+b_e);
end

% 
% function f = encode(W_e,b_e,x)
%     f  = 1./(1+exp(-(W_e*x+b_e)));
% end
%     

