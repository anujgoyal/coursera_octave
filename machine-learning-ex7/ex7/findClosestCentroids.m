function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
% https://en.wikibooks.org/wiki/Octave_Programming_Tutorial/Linear_algebra

% https://www.coursera.org/learn/machine-learning/discussions/weeks/8/threads/ncYc-ddQEeWaURKFEvfOjQ

% create a distance matrix
distance = zeros(length(X), K);

% loop through each centroid and calculate distance
for k = 1:K
    % calculate distance
    d = bsxfun(@minus, X, centroids(k,:) );
    % store sum of differences
    distance(:,k) = sum(d.^2,2);
end

[foo,idx] = min(distance, [], 2);

% =============================================================
end
