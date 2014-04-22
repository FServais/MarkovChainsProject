clear all;
close all;

%       QUESTION 2 : T�l�portation

% Initialisation
data = load('graphes.mat');

U = data.U;
G = data.G;

%% Question 2.3
alpha = 0.15;
n = size(G, 1);
Qt = getQTeleport(G, alpha);

pi_0 = zeros(1, n);
pi_0(1) = 1;

pi_s = findStationnaryPi(Qt, pi_0);

[~, max_indexes] = sort(pi_s);

websites = fliplr(U(max_indexes(1, end-9:end), :).').'

%% Question 2.4
t1 = 1;
t2 = 10;
t3 = 20;
p1 = 1; % montefiore
p2 = max_indexes(1, end-1); % 2�me site
p3 = max_indexes(1, end); % 1er site
getProbWithPastAndFut(Qt, t1, p1, t2, p2, t3, p3);

%% Question 3.1
alpha2 = 1;
Qt2 = getQTeleport(G, alpha2);
pi_s2 = findStationnaryPi(Qt2, pi_0);

figure; hist(pi_s, 60);
title('Distribution stationnaire pour \alpha = 0.15');
xlabel('\pi');
ylabel('Nombre de PageRank');
figure; hist(pi_s2, 60);
title('Distribution stationnaire pour \alpha = 1');
xlabel('\pi');
ylabel('Nombre de PageRank');