function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================oRanae Shride
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
   
    %% Debugging
    %prod1 =  (theta(1) + (theta(2)*X(:,1)) - y); fprintf('size prod1: %f\n', size(prod1));
    %prod2 =  X(:,1); fprintf('size prod2: %f\n', size(prod2));
    %prod3 =  (theta(1) + (theta(2)*X(:,1)) - y) .* X(:,1); fprintf('size prod3: %f\n', size(prod3));
 
    % WRONG, note that the new value of theta(1) is being used in the second statement
    %theta(1) = theta(1) - ((alpha/m) * sum((theta(1) + (theta(2)*X(:,2)) - y) .* X(:,1)));  % incorrect
    %theta(2) = theta(2) - ((alpha/m) * sum((theta(1) + (theta(2)*X(:,2)) - y) .* X(:,1)));  % incorrect

    % CORRECT
    t0 = theta(1); %%% NB: save as temp values
    t1 = theta(2);
    theta(1) = t0 - ((alpha/m) * sum((t0 + (t1*X(:,2)) - y) .* X(:,1)));
    theta(2) = t1 - ((alpha/m) * sum((t0 + (t1*X(:,2)) - y) .* X(:,2)));

    %fprintf('iter[%d] = [%f,%f] \n', iter, theta(1), theta(2));
    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);
    %fprintf('J[%0004d] = %f\n', iter, J_history(iter));

end % for

end % function
