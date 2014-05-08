%% Test of the estimation method for alpha
function [alpha_e, E, E_mean, Eq] = test3(n, k, m, thresh)
    A = getRandomAdjacency(k, thresh);
    alpha = 0.5;
    Q = getQTeleport(A, alpha);
    
    pi_0 = ones(1,k) / k;

    X = zeros(n,m);

    for i = 1:n
        X(i,:) = GenMarkov(Q, pi_0, m);
    end

    [alpha_est, ~] = estimateAlpha(X, A);
    
    alpha_e = mean(alpha_est);
      % hist(alpha_est, 30);
    E = abs(alpha_est - alpha);
    E_mean = mean(E);
    Eq = var(alpha_est) + mean(E)^2;
end