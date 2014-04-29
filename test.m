%% Intuivutve
A = [0 1 1 0 0 1 1;
     0 0 0 1 0 0 0;
     1 1 0 0 0 0 0;
     0 0 0 0 1 0 0;
     1 0 0 0 0 0 1;
     0 1 0 1 0 0 0;
     0 0 0 0 1 1 0];
 
k = 7; % graph size

Q = getQTeleport(A, 0.5)
pi_0 = [1 0 0 0 0 0 0];
  
n = 1; % number of traces
m = 500; % trace size

X = GenMarkov(Q, pi_0, m);
Tr = countTransitions(X, k);
% smoothed
Tr = Tr + ones(k,k);

Q_est = estimateQ(X,k)

% Comptage
rep = repmat(sum(Tr, 2), 1, k);
Q_est2 = Tr ./ rep

max(max(abs(Q_est2 - Q_est)))
 