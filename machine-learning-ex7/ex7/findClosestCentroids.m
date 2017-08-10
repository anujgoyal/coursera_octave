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

fprintf('X: %d x %d\n', rows(X), columns(X));
for k = 1:K
    foo = (X - centroids(k,:)).^2;
    foo = sum(foo)

    % calculate mindist for first centroid
    mindist = abs(sum(X(i,:) - centroids(1,:))); % matrix(i,:) gets whole row
    idx(i) = 1;
    % NB: mindist is a vector, sum up the vector

    % loop through each centroid and find minimal distance, store centroid index
    for c = 2:K
        dist = abs(sum(X(i,:) - centroids(c,:)));
        fprintf('d: %d, m: %d\n', dist, mindist)
        if (dist < mindist)
            fprintf('changed! idx(%d): %d\n', i, c);
            mindist = dist;
            idx(i) = c;
        end
    end
    fprintf('final idx(%d): %d\n\n', i, idx(i));
end

% =============================================================
end
