% Returns the logarithmic probability of a given sequence for a
% transition matrix Q.
% @param seq Sequence (row vector)
% @param Q Transition matrix

function [ prob ] = logProbOfSequence( seq, Q )
    prob = 0; % log(p(x0)) = log(1) = 0
    for i=1:(length(seq)-1)
        prob = prob + log(Q(seq(i),seq(i+1)));
    end
end


% Explication : 
% Par exemple on cherche la probabilité d'avoir le chemin x0->x1->x2
% Soit p(x2,x1,x0) = p(x2|x1,x0) . p(x1, x0)
%                  = p(x2|x1) . p(x1|x0) . p(x0)
%                  = p(x2|x1) . p(x1|x0) -> Se trouvent dans Q
% Passé en log :   = log(p(x2|x1)) + log(p(x1|x0))
% Note : j'ai essayé sans passer par les log, mais la précision est pas
% suffisante.