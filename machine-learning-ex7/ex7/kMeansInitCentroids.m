function centroids = kMeansInitCentroids(X, K)
%KMEANSINITCENTROIDS This function initializes K centroids that are to be 
%used in K-Means on the dataset X
%   centroids = KMEANSINITCENTROIDS(X, K) returns K initial centroids to be
%   used with the K-Means on the dataset X
%

% You should return this values correctly
centroids = zeros(K, size(X, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: Set centroids to randomly chosen examples from dataset X

% ramdomly permute the indices of X
randomIdx = randperm(size(X,1));

% pick first K examples
centroids = X(randomIdx(1:K), :);

% =============================================================
end
