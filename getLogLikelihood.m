function p = getLogLikelihood(Q,X)
%getLogLikelihood compute the log likelihood a transition matrix for a
%Markov Chain
%   [p] = getLogLikelihood(Q,X) if Q is an array of transition matrices 
%   and X an array of which the lines are markov chains (of the same size),
%   p is a matrix of which the element at row i and column j is the 
%   log-likelihood of the ith transition matrix for the jth markov chain
    [x_q, y_q, z_q] = size(Q);
    [x_c, ~] = size(X);
    
    if y_q ~= z_q
        error('Second and third dimensions of Q must be the same : a transition matrix is a square matrix');
    end
    
    p = zeros(x_q, x_c);

    for i = 1:x_c
        Tr = countTransitions(X(i,:), y_q); 
        for j = 1:x_q
            p(j,i) = sum(sum(sum(log(squeeze(Q(j,:,:))) .* Tr)));
        end
    end
end
