function Q = AdjDN2Q(A)
%AdjDN2Q returns the transition matrix modified by adding some links from
%dangling nodes to any other nodes
%   [Q] = AdjDN2Q(A) : if A is an adjacency matrix, then Q is the
%   transition matrix
    n = size(A, 2);
    
    % adapt adjancency matrix by adding links on dangling nodes
    rows = find(sum(A, 2) == 0);
    A(rows, :) = ones(length(rows),n);
    
    sumRows = sum(A, 2);
    sumMat = repmat(sumRows, 1, size(A, 2));
    Q = A ./ sumMat;
end