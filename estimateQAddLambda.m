function Qest = estimateQAddLambda(X,k,lambda)
%estimateQAddLambda(X,k,lambda) return an estimated transition matrix for
%a given markov chain
%   Qest = estimateQAddLambda(X,k,lambda) : if X is a markov chain, k the
%   number of possible states of this chain and lambda the laplace
%   correction to apply to the count matrix of Tr, than Qest is the 
%   estimated matrix built by the MLE method (an by applying the 
%   Add-Lambda smoothing)
    Tr = countTransitions(X,k);
    
    % smoothing 
    Tr = Tr + lambda * ones(k,k);
    
    Qest = estimateQMLE(Tr,k);
end
