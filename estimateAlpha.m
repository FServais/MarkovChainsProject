function [alpha, alpha_mat] = estimateAlpha(X,G)
%estimateAlpha estimate the probability alpha that a random surfer jumps
%from a node to another instead of just following a existing branch
    [k, ~] = size(G);
    [n, l] = size(X);
    
    % estimate Q for each X(i,:)
    Q_est = zeros(k,k,n);
    Q_temp = AdjDN2Q(G);
    alpha_mat = zeros(k,k,n);
    alpha = zeros(1,n);
    
    for i = 1:n
    	Q_est(:,:,i) = estimateQ(X(i,:), k);
        
        % alpha mat
        alpha_mat(:,:,i) = (squeeze(Q_est(:,:,i)) - Q_temp) .* (- Q_temp + ones(k,k) ./ k).^(-1);
        
        % alpha
        temp = squeeze(alpha_mat(:,:,i));
        row_excluded = (temp ~= -inf) & (temp ~= inf) & (~isnan(temp));
        alpha(i) = mean(temp(row_excluded));
    end
end