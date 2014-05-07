function [biais, Eq, Emean, Estd, Eqmean, Eqstd, Q] = test_estimateQ(n,m,k)
    % n : number of traces
    % m : number of element in a trace
    % k : graph order
    
    A = getRandomAdjacency(k, 0.575);

    Q = getQTeleport(A, 0.5);
    pi_0 = ones(1,k) / k;

    X = zeros(n,m);
    Q_est = zeros(n,k,k); 
    biais = zeros(k,k);
    Eq = zeros(k,k);
    
    for i = 1:n
        X(i,:) = GenMarkov(Q, pi_0, m);
        Q_est(i,:,:) = estimateQ(X(i,:), k);
        biais = biais + abs((squeeze(Q_est(i,:,:)) - Q)) / n;
        Eq = Eq + biais.^2 / n;
    end 

    Emean = mean(mean(biais));
    Estd = std(biais(1:k*k));
    
    Eqmean = mean(mean(Eq));
    Eqstd = std(Eq(1:k*k));
end