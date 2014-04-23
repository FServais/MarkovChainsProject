% Estimate the transition matrix of a markov chain
% from a realization of this chain.
%
% @param tr Realization of the chain
%
% @return Q Transition matrix
function [ Q ] = estimateQFromRealization( tr )
    % Transition : from i to j
    numOfRealizations = length(tr);
    Q = zeros(numOfRealizations,numOfRealizations);
    for i=1:numOfRealizations-1
        Q(tr(i),tr(i+1)) = Q(tr(i),tr(i+1))+1;
    end
    Q = Adj2Q(Q); % It's not an adjacency matrix, but the computation is the same...

end

