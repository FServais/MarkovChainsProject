function [Qest] = estimateQMLE(Tr,k)
%estimateQMLE Estimate a transition matrix based on the count of
%transitions
%   Qest = estimateQMLE(Tr) : if Tr is the count matrix of a markov chain,
%   and k the number of node in the graph then Qest is the resulting 
%   estimated matrix
    Qest = Tr ./ repmat(sum(Tr, 2), 1, k);
end

