function N = countTransitions(X, n)
%countTranstions counts the number of transitions in a markov chain
%   N = countTransitions(X,n) : if X is a markov chains and and n  is the 
%   number of possible state, then N is a matrix of which the element at 
%   the ith row and the jth column is the number of transition from the 
%   state i to the state j in the markov chain
    N = zeros(n, n);
    
    for i=1:(length(X) - 1)
        curr = X(i);
        next = X(i + 1);
        N(curr,next) = N(curr,next) + 1;
    end
end