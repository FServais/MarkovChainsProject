function Q = estimateQ(X, k)
%ESTIMATEQ estimate the transition matrix of a markov chain
%   Q = ESTIMATEQ(X,k) : if X is a markov chain and k the number of 
%   possible state, then Q is the transition matrix estimated using the 
%   maximum likelihood method

    Tr = countTransitions(X, k);
    
    % Laplacian smoothing
    Tr = Tr + 0.06 * ones(k,k);
    
    Q = Tr ./ repmat(sum(Tr, 2), 1, k);
%     B = ones(k - 1, 1);
%     Q = zeros(k,k);
% 
%     for i=1:k
%         A = getLikelihoodMat(Tr(i,:));
%         s = linsolve(A,B).';
%         Q(i,:) = [s (1 - sum(s, 2))];
%     end
end 

function L = getLikelihoodMat(count_vec)
%GETLIKELIHOODMAT create the right-member matrix of the system to solve 
% for finding one line of a transition matrix
%   L = GETLIKELIHOODMAT(count_vec) : if count_vec is a vector of length n
%   and of which the jth element is the the count of the transition from 
%   one state to the jth state of a markov model, then L is a matrix of 
%   of size (n - 1)x(n - 1) containing 1 everywhere except on the diagonal
%   of which the ith element is 
%               
%               (count_vec(n) + count(j)) / count_vec(j) 
    n = length(count_vec);
    L = ones(n - 1,n - 1);
    
    for i=1:(n - 1)
        L(i,i) = (count_vec(1,n) / count_vec(1,i)) + 1;
    end
end