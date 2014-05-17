function numgrad = computeNumericalGradient(J, theta,info,root,tree)
% numgrad = computeNumericalGradient(J, theta)
% theta: a vector of parameters
% J: a function that outputs a real-number. Calling y = J(theta) will return the
% function value at theta. 
  
% Initialize numgrad with zeros
EPSILON=0.0004;

%% ---------- YOUR CODE HERE --------------------------------------
% Instructions: 
% Implement numerical gradient checking, and return the result in numgrad.  
% (See Section 2.3 of the lecture notes.)
% You should write code so that numgrad(i) is (the numerical approximation to) the 
% partial derivative of J with respect to the i-th input argument, evaluated at theta.  
% I.e., numgrad(i) should be the (approximately) the partial derivative of J with 
% respect to theta(i).
%                
% Hint: You will probably want to compute the elements of numgrad one at a time. 


%i=1;
ei=zeros(size(theta));
ei(1)=1;
numgrad=(J(theta+EPSILON*ei,info,root,tree)-J(theta-EPSILON*ei,info,root,tree))/(2*EPSILON);







%% ---------------------------------------------------------------
end
