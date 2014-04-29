%% Intuivutve
A = [0 1 1 0 0 1 1;
     0 0 0 1 0 0 0;
     1 1 0 0 0 0 0;
     0 0 0 0 1 0 0;
     1 0 0 0 0 0 1;
     0 1 0 1 0 0 0;
     1 0 0 0 1 0 0];
 
k = 7; % graph size

Q = getQTeleport(A, 0.5)
pi_0 = [1 0 0 0 0 0 0];
  
n = 1; % number of traces
m = 100; % trace size

X = GenMarkov(Q, pi_0, m);

Q_est = estimateQ(X, k);

Q_temp = AdjDN2Q(A);

%alpha = (Q_est - Q_temp) * (- Q_temp + ones(k,k) ./ k)^(-1);

alpha_item = (Q_est - Q_temp) .* (- Q_temp + ones(k,k) ./ k).^(-1)