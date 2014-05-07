function Q = estimateQ(X, k)
%ESTIMATEQ estimate the transition matrix of a markov chain
%   Q = ESTIMATEQ(X,k) : if X is a markov chain and k the number of 
%   possible state, then Q is the transition matrix estimated using the 
%   maximum likelihood method
    Q = estimateQAddLambda(X,k,0.06);
end 
