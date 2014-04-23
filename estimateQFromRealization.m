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
    
    % It's not an adjacency matrix, but the computation is the same...
    %Q = Adj2Q(Q); 
    
    % Other solution with Laplace estimation... -> Needs debug
    s = sum(Q,2)
    nodes = 50;
    for i=1:size(Q,1) % Row
        for j=1:size(Q,2) % Col
            Q(i,j) = (Q(i,j)+1)/(s(i)+nodes); % Hell, the sum over a line doesn't equal to 1...
        end
    end
    
    
end

