% Returns the logarithmic probability of a given sequence for a
% transition matrix Q.
% @param seq Sequence (row vector)
% @param Q Transition matrix

function [ prob ] = logProbOfSequence( seq, Q )
    prob = 0;
    for i=1:(length(seq)-1)
        prob = prob + log(Q(seq(i),seq(i+1)));
    end
    
end

