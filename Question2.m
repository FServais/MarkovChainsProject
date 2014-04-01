clear all;
%% teleportation
%% init
data = load('graphes.mat');

U = data.U;
G = data.G;

%% Q.2.2.3
alpha = 0.15;
n = size(G, 1);
Qt = getQTeleport(G, alpha);

pi_0 = zeros(1, n);
pi_0(1) = 1;

pi_s = findStationnaryPi(Qt, pi_0, 10);

[~, max_indexes] = sort(pi_s);

U(max_indexes(1, end-10:end), :)
%% Q.2.2.4