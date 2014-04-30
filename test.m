%% Intuivutve
A = [0 1 1 0 0;
     0 0 0 1 0;
     1 1 0 0 0;
     0 0 1 0 1;
     1 0 0 1 0];
 
k = 5; % graph size

Q = getQTeleport(A, 0.5)
pi_0 = [1 0 0 0 0 0 0];
  
n = 50; % number of traces
m = 1000; % trace size

X = zeros(n,m);
Q_est = zeros(n,k,k);
E = zeros(k,k);

for i = 1:n
	X(i,:) = GenMarkov(Q, pi_0, m);
	Q_est(i,:,:) = estimateQ(X(i,:), k);
	E = E + Q - squeeze(Q_est(i,:,:));
end

E = squeeze(var(Q_est)) + (E/n).^2
mean(mean(E))

