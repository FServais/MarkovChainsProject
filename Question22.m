L = load('traces.mat');

Trmat = L.Trmat;
Tr1 = L.Tr1;
Tr2 = L.Tr2;
G = L.G;
n = 50; % number of traces

%% Q.2.2.2
k = 10;
m = 100; % Trace size
t = 20; % number of tests

alpha = zeros(t,1);

for j=1:t

    A = getRandomAdjacency(k, 0.45);
    Q = getQTeleport(A, 0.86545);

    pi_0 = zeros(k, 1);
    pi_0(1) = 1;
    Tr = zeros(n,m);
    for i=1:n
        Tr(i,:) = GenMarkov(Q, pi_0.', m).';
    end
    [alpha_temp, alpha_mat] = estimateAlpha(Tr,A);
    alpha(j) = mean(alpha_temp);
end

mean(alpha)

%% Q.2.2.3
% Q1 = estimateQ(Tr1, 50);
% Q2 = estimateQ(Tr2, 50);
% 
% Q_temp = AdjDN2Q(G);
% 
% [alpha, alpha_m] = estimateAlpha(Trmat, G);
% %p = getLogLikelihood(Q, Trmat);

alpha_1 = estimateAlpha(Tr1,G)
alpha_2 = estimateAlpha(Tr2,G)

count = zeros(1,size(Trmat,1));
for i=1:size(Trmat,1)
    alpha_est = estimateAlpha(Trmat(i,:), G);
    if abs(alpha_est - alpha_1) < abs(alpha_est - alpha_2)
        count(i) = 1;
    else
        count(i) = 2;
    end
end
