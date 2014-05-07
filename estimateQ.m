function Q = estimateQ(X, k)
%ESTIMATEQ estimate the transition matrix of a markov chain
%   Q = ESTIMATEQ(X,k) : if X is a markov chain and k the number of 
%   possible state, then Q is the transition matrix estimated using the 
%   maximum likelihood method

    Tr = countTransitions(X, k);
    
    m = 0.06;
    
    % Laplacian smoothing
    %Tr = Tr + m * ones(k,k);
    
    % Jelinek-Mercer smoothing
    s = sum(Tr,2);
    lambda = 0.05;
    
    for j=1:size(Tr,2)
        for i=1:size(Tr,1)
            Tr(i,j) = lambda * Tr(i,j) + (1 - lambda) * s(j);
        end
    end
     
     % Résolution par comptage
     Q = Tr ./ repmat(sum(Tr, 2), 1, k);
    

    % Unigram priority
%     s = sum(Tr,2);
%     m = 2 * k;
%     
%     Q = zeros(k,k);
%     for i=1:size(Tr,2)
%         for j=1:size(Tr,1)
%             Tr(i,j) = (Tr(i,j) + m*s(j)/length(X))/(s(i)+m);
%         end
%     end
%     
%     Q = Tr;

    
    % Résolution matrcielle
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
