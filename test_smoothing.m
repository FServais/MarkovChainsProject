%% Initialization
U = load('traces.mat');
G = U.G;
Tr1 = U.Tr1;
Tr2 = U.Tr2;
 
k = 50; % graph size
pi_0 = [1 0 0 0 0 0 0];

Q = getQTeleport(G, 0.5);

n = 50; % number of traces
m = 1000; % trace size

%% Quadratic error test

X = zeros(n,m); % traces
Q_est = zeros(n,k,k); % Q per graph
E = zeros(k,k); % quadratic error

for i = 1:n
    X(i,:) = GenMarkov(Q, pi_0, m);
    Q_est(i,:,:) = estimateQ(X(i,:), k);
    E = E + Q - squeeze(Q_est(i,:,:));
end

E = squeeze(var(Q_est)) + (E./n).^2;
fprintf(sprintf('Graph %dx%d | Trace size = %d : %g\n', k, k, m, mean(mean(E))));    


%% Surfer affectation test

X_s = zeros(n,m);

% True Q of surfers
Q_s_1_2 = zeros(2,k,k);
Q_s_1_2(1,:,:) = getQTeleport(G, 0.3);
Q_s_1_2(2,:,:) = getQTeleport(G, 0.7);

% Estimate Q from trace 
tr_s1 = GenMarkov(squeeze(Q_s_1_2(1,:,:)), pi_0, m);
tr_s2 = GenMarkov(squeeze(Q_s_1_2(2,:,:)), pi_0, m);

Q_est_s1 = estimateQ(tr_s1, k);
Q_est_s2 = estimateQ(tr_s2, k);
Q_est(1,:,:) = Q_est_s1;
Q_est(2,:,:) = Q_est_s2;

% Generate 7 traces to surfer 1 and 43 to surfer 2
ns1 = 7;
for i=1:ns1
    X_s(i,:) = GenMarkov(squeeze(Q_s_1_2(1,:,:)), pi_0, m);
end
for i=ns1+1:n
    X_s(i,:) = GenMarkov(squeeze(Q_s_1_2(2,:,:)), pi_0, m);
end

o = getOrigin(Q_est, X_s, [0.5 0.5]);
s1 = length(find(o==1))
s2 = length(find(o==2))

