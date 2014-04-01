function Q = uniformQFromAdjacency(A)
    sumRows = sum(A, 2);
    Q = A ./ repmat(sumRows, 1, size(A, 2));
end