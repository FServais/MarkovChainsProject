function Q = Adj2Q(A)
%Adj2Q compute the transition matrix for an adjacency matrix
%   [Q] = Adj2Q(A) : if A is an adjacency matrix, Q is the corresponding
%   transition matrix
    sumRows = arrayfun(@replaceZero,sum(A, 2));
    sumMat = repmat(sumRows, 1, size(A, 2));
    Q = A ./ sumMat;
end


function y = replaceZero(x)

    if x == 0
        y = 1;
    else
        y = x;
    end

end