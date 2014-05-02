function E = testQ212(n,m,k)
    % n : number of traces
    % m : number of element in a trace
    
    A = getRandomAdjacency(k, 0.575);

    Q = getQTeleport(A, 0.5);
    pi_0 = [1 0 0 0 0 0 0];

    X = zeros(n,m);
    Q_est = zeros(n,k,k);
    E = zeros(k,k);

    for i = 1:n
        X(i,:) = GenMarkov(Q, pi_0, m);
        Q_est(i,:,:) = estimateQ(X(i,:), k);
        E = E + Q - squeeze(Q_est(i,:,:));
    end

    E = squeeze(var(Q_est)) + (E/n).^2;
    mean(mean(E))
end
