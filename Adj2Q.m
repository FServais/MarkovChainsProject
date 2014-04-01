function Q = Adj2Q(A)
% Returns the transition matrix Q (with uniform probability) for an
% adjacency matrix A
% @param A the adjacency matrix (containing no dangdling nodes
% @return Q the transition matrix
    sumRows = sum(A, 2);
    sumMat = repmat(sumRows, 1, size(A, 2));
    Q = A ./ sumMat;
end