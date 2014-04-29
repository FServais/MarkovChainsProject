function [alpha, alpha_mat] = estimateAlpha(X,G)
%estimateAlpha estimate the probability alpha that a random surfer jumps
%from a node to another instead of just following a existing branch
    [k, ~] = size(G);
    [n, l] = size(X);
    
    % estimate Q for each X(i,:)
    Q_est = zeros(n,k,k);
    for i = 1:n
    	Q_est(i,:,:) = estimateQ(X(i,:), k);
    end
   
    % estimate alpha values
    Q_temp = AdjDN2Q(G);

    alpha_mat = zeros(n,k,k);
    for i = 1:n
        alpha_mat(i,:,:) = (squeeze(Q_est(i,:,:)) - Q_temp) .* (- Q_temp + ones(k,k) ./ k).^(-1);
    end
    
    alpha = mean(mean(alpha_mat, 3), 2);
end