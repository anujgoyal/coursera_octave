function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

% add 1 for bias
X = [ones(m,1) X];
%asup1, inputs or X in this case
asup2 = sigmoid(X * Theta1');   % (5000 x 401) X (401 x 25)

%size (X)
%size (Theta1)
%size (asup2)

% add 1 for bias
asup2 = [ones(size(asup2,1), 1) asup2];
asup3 = sigmoid(asup2 * Theta2');   % (5000 x 26) X (26 x 10)

% select index with max value
[val, p]  = max(asup3, [], 2);


% =========================================================================


end
