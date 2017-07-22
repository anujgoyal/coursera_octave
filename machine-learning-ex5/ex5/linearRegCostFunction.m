function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%               You should set J to the cost and grad to the gradient.

% cost function
% fprintf('y %d x %d\n', rows(y), columns(y));
%% https://www.coursera.org/learn/machine-learning/discussions/weeks/6/threads/GJsEoGV5EeevxhLrWZdQZA
% The tricky thing about test cases that use theta and lambda values of 1 is 
% that it makes it confusing to detect a large class of programming errors, such 
% as missing the "square" operator, and not omitting theta(1) from the 
% regularized cost value.
% AG: super tricky
J = ((1/(2*m)) * sum( (X*theta - y).^2 )); % uses full theta
temp = theta; temp(1) = 0;   % have to zero out first column
J = J + (lambda/(2*m) * sum(temp.^2));

% gradient calculation function
grad = (1/m) * sum((X*theta - y) .* X);
grad = grad + (lambda/m)*temp;

% =========================================================================

grad = grad(:);

end
