%       QUESTION 2.2 : Estimation de alpha

L = load('traces.mat');

Trmat = L.Trmat;
Tr1 = L.Tr1;
Tr2 = L.Tr2;
G = L.G;
[n, ~] = size(Trmat); % number of traces


% %% Q.2.2.2
% k = 50;
% 
% m = 100; % Trace size
% t = 20; % number of tests
% 
% alpha = zeros(t,1);
% 
% pi_0 = zeros(k, 1);
% pi_0(1, 1) = 1;
% pr_diff = zeros(t,1);
% 
% for j=1:t
%     % Graphe réel généré aléatoirement
%     A = getRandomAdjacency(k, 0.45);
%     Q = getQTeleport(A, 0.86545);
% 
%     % Génération de la trace
%     pi_0 = zeros(1,k);
%     pi_0(1) = 1;
% 
%     Tr = zeros(n,m);
%     for i=1:n
%         Tr(i,:) = GenMarkov(Q, pi_0.', m).';
%     end
%     
%     % Estimation
%     [alpha_temp, alpha_mat] = estimateAlpha(Tr,A);
%     alpha(j) = mean(alpha_temp);
%     
%     % Test avec Pagerank
%     
%     %   Pagerank réel
%     [pi_s_reel, ~] = findStationnaryPi(Q, pi_0);
%     pr_reel = max(pi_s_reel);
%     
%     %   Pagerank estimé
%     Q_pr = getQTeleport(A, alpha(j));
%     [pi_s_est, ~] = findStationnaryPi(Q_pr, pi_0);
%     pr_est = max(pi_s_est);
%     
%     %   Erreur sur le pagerank
%     pr_diff(j) = abs(pr_est-pr_reel)/pr_reel;
% end
% 
% alpha_moy = mean(alpha)
% pr_moy = mean(pr_diff)

%% Q.2.2.4
% Q1 = estimateQ(Tr1, 50);
% Q2 = estimateQ(Tr2, 50);
% 
% Q_temp = AdjDN2Q(G);
% 
% [alpha, alpha_m] = estimateAlpha(Trmat, G);
% %p = getLogLikelihood(Q, Trmat);

m = length(Tr1);
Trs = [Tr1; Tr2];

alpha_true = estimateAlpha2(Trs, G, 0.001);
alpha_est = estimateAlpha2(Trmat, G, 0.001);

o = zeros(1,n);
for i=1:n
    if (abs(alpha_est(i) - alpha_true(1)) ...
            < abs(alpha_est(i) - alpha_true(2)))
        o(i) = 1;
    else
        o(i) = 2;
    end
end
