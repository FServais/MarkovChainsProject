function o = getOrigin(Q, X, P_q)
%getOrigin find the transition matrix that is the most likely to have
%generated the markov chain
%   o = getOrigin(Q,X,P_q) : if Q is a vector of transition matrix of size 
%   (m x n x n), X a vector of k trace of size l and P_q a vector of which
%   the ith element is the probability that the ith matrix has generated a 
%   markov chain in X, then is a vector of size k contains the index of the
%   transition matrix that is the most likely to have generated the markov
%   chain
%
%   /!\ m must be equal to 2
    [m, n, n2] = size(Q);
    [k, l] = size(X);
    [~, m2] = size(P_q);
    
    if(m ~= 2)
        error('m must be the 2');
    end
    
    if(n ~= n2)
        error('The transition matrices must be square matrices');
    elseif(m ~= m2)
        error('The number of matrices in Q must be equal to the number of probability in P_q ');
    end
    
    p = getLogLikelihood(Q, X);
    
   	log_prob = p(1,:) - p(2,:) + log(P_q(1) / P_q(2));
    o = zeros(1,k);
    probasTr = zeros(2,k);
    probasTr(1,:) = log(0.5)+p(1,:) / ((p(1,:)+ p(2,:))+ log(0.5));
    probasTr(2,:) = log(0.5)+p(2,:) / ((p(1,:)+ p(2,:))+ log(0.5));
    probasTr
    for i = 1:k;
        if(log_prob(i) >= 0)
            o(i) = 1;
        else
            o(i) = 2;
        end
    end
end