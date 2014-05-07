%% Intuivutve
A = [0 1 1 0 0 1 1;
     0 0 0 1 0 0 0;
     1 1 0 0 0 0 0;
     0 0 0 0 0 0 0;
     1 0 0 0 0 0 1;
     0 1 0 1 0 0 0;
     1 0 0 0 1 0 0];
 
k = 7; % graph size
alpha = 0.5;
Q = getQTeleport(A, alpha);
pi_0 = [1 0 0 0 0 0 0];
  
n = 100; % number of traces
m = 2000; % trace size
X = zeros(n,m);

for i = 1:n
    X(i,:) = GenMarkov(Q, pi_0, m);
end

[alpha_est, alpha_mat] = estimateAlpha(X, A);

biais = abs(alpha_est - alpha);
mean(biais)
quad_err = var(alpha_est) + mean(biais)^2