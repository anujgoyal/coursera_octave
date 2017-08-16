function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
% [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, num_features, lambda) 
% returns the cost and gradient for the collaborative filtering problem.

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), num_users, num_features);

% Return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative filtering. 
% Concretely, first implement the cost function (without regularization) and make sure it is matches our costs. 
% After that, implement the gradient and use the checkCostFunction routine to check that the gradient is correct.
% Finally, you should implement regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%  X_grad - num_movies x num_features matrix, containing the partial derivatives w.r.t. to each element of X
%  Theta_grad - num_users x num_features matrix, containing the partial derivatives w.r.t. to each element of Theta

% fprintf('X: %d x %d\n', rows(X), columns(X));
% fprintf('Theta: %d x %d\n', rows(Theta), columns(Theta));
% fprintf('Y: %d x %d\n', rows(Y), columns(Y));
% fprintf('R: %d x %d\n', rows(R), columns(R));

% X: 5 x 3
% Theta: 4 x 3
% Y: 5 x 4
% R: 5 x 4

%%% Step 1: calculate cost w/o regularization
J = (1/2) * sum(sum( ((X*Theta' - Y).^2).*R)); % remember have to sum(sum(...)) for a matrix
%%% Step 3: now add the regularization
J = J + ((lambda/2)*sum(sum(Theta.^2))) + ((lambda/2)*sum(sum(X.^2)));

%%% Step 2: initial attempt
%for i = 1:num_movies
%    idx = find( R(i,:)==1 );
%    Theta_temp = Theta(idx,:);
%    Y_temp = Y(i,idx);
%    %fprintf('\ni: %d\n',i);
%    %fprintf('X(i,:):  %d x %d\n', rows(X(i,:)), columns(X(i,:)));
%    %fprintf('Theta_temp'': %d x %d\n', rows(Theta_temp'), columns(Theta_temp'));
%    %fprintf('Y_temp: %d x %d\n', rows(Y_temp), columns(Y_temp));
%    %fprintf(' Theta_temp:  %d x %d\n', rows(Theta_temp), columns(Theta_temp));
%    X_grad(i,:) = (X(i,:)*Theta_temp' - Y_temp)*Theta_temp;
%end
%for j = 1:num_users
%    idx = find( R(:,j)==1 );
%    %Theta_temp = Theta(:,idx);
%    Theta_temp = Theta(j,:);
%    Y_temp = Y(:,j);
%    fprintf('\nj: %d\n',j);
%    fprintf('Theta_temp: %d x %d\n', rows(Theta_temp), columns(Theta_temp));
%    fprintf('X(:,j):  %d x %d\n', rows(X(:,j)), columns(X(:,j)));
%    fprintf('Theta_temp'': %d x %d\n', rows(Theta_temp'), columns(Theta_temp'));
%    fprintf('Y_temp: %d x %d\n', rows(Y_temp), columns(Y_temp));
%    fprintf('X(:,j):  %d x %d\n', rows(X(:,j)), columns(X(:,j)));
%    Theta_grad(j,:) = (X(:,j)*Theta_temp' - Y_temp)*X(:,j);
%end

%%% Step 2: caculate gradients for X and Theta
X_grad= ((X*Theta' - Y).*R) *Theta; %fprintf('X_grad:  %d x %d\n', rows(X_grad), columns(X_grad));
Theta_grad = ((X*Theta').*R - (Y.*R))' * X; %fprintf('Theta_grad:  %d x %d\n', rows(Theta_grad), columns(Theta_grad));


% =============================================================
grad = [X_grad(:); Theta_grad(:)];
end
