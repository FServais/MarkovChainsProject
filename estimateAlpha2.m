function alpha_est = estimateAlpha2(X,G,step)
%estimateAlpha2 estimate the probability alpha that a random surfer jumps
%from a node to another instead of just following an existing branch by
%computing the maximum likelihood of the trace for each Q computed from
%each estimated alpha.
    [k, ~] = size(G);
    [n, ~] = size(X);
    
    % estimate Q for each X(i,:)
    Q = zeros(n,k,k);
    alpha = 0.01:step:1;
    log_like = zeros(n,length(alpha));
    
    for i = 1:length(alpha)
    	Q(i,:,:) = getQTeleport(G, alpha(i));
    end
    
    % get likelihood for each alpha and each trace
    log_like = getLogLikelihood(Q, X);

    % find max likelihood
    [~, index] = max(log_like);
    
    alpha_est = zeros(1,n);
    
    % select the best alpha for each trace
    for i = 1:n
        alpha_est(i) = alpha(index(i));
    end
end