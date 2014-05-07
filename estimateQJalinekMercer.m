function Qest = estimateQJalinekMercer(X,k,lambda)
%estimateQJalinekMercer returns an estimation of the transition matrix
%for the given markov chain
%   Qest = estimateQJalinekMercer(X,k,lambda) : if X is a markov chain, k
%   the order of the graph, lambda the interpolation factor for smoothing
%   the data then Qest is the estimated matrix built by the MLE method (an
%   by applying the Jalinek-Mercer smoothing)

    Tr = countTransitions(X,k);
    
    % smoothing
    s = sum(Tr,2);
    
    for j=1:size(Tr,2)
        for i=1:size(Tr,1)
            Tr(i,j) = lambda * Tr(i,j) + (1 - lambda) * s(j);
        end
    end
    
    Qest = estimateQ(Tr,k);
end
