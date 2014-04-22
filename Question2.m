clear all;
close all;

%       QUESTION 2 : Téléportation

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

[pi_s, ~] = findStationnaryPi(Qt, pi_0);

[~, max_indexes] = sort(pi_s);

websites = fliplr(U(max_indexes(1, end-9:end), :).').'

%% Question 2.4
t1 = 1;
t2 = 10;
t3 = 20;
p1 = 1; % montefiore
p2 = max_indexes(1, end-1); % 2ème site
p3 = max_indexes(1, end); % 1er site
getProbWithPastAndFut(Qt, t1, p1, t2, p2, t3, p3);

%% Question 3.1
alpha2 = 1;
Qt2 = getQTeleport(G, alpha2);
[pi_s2, ~] = findStationnaryPi(Qt2, pi_0);

figure; hist(pi_s, 60);
title('Distribution stationnaire pour \alpha = 0.15');
xlabel('\pi');
ylabel('Nombre de PageRank');
figure; hist(pi_s2, 60);
title('Distribution stationnaire pour \alpha = 1');
xlabel('\pi');
ylabel('Nombre de PageRank');

%% Question 3.2

alpha = 0.0;
n = size(G, 1);


pi_0 = zeros(1, n);
pi_0(1) = 1;
evolPageRank = zeros(5,20);
Alpha = zeros(1,20);

I = zeros(1,20);
for j=1:20
    Alpha(j)= alpha;
    Qt = getQTeleport(G, alpha);
    [pi_s, I(j)] = findStationnaryPi(Qt, pi_0);
    evolPageRank(:,j) = pi_s(1:5);
    alpha =alpha + 0.05;
end

figure;

r = [227 45 26]./255;
b = [61 73 245]./255;
g = [122 219 71]./255;
c = [0 197 221]./255;
y = [255 199 73]./255;

hold on;
plot(evolPageRank(1,:),'Color', r, 'Marker', '.');
plot(evolPageRank(2,:),'Color', b, 'Marker', '.');
plot(evolPageRank(3,:),'Color', g,'Marker', '.');
plot(evolPageRank(4,:),'Color', c, 'Marker', '.');
plot(evolPageRank(5,:),'Color', y, 'Marker', '.');
title('Evolution du pageRank en fonction d alpha');
%% Question 1.3.3
% Lorsque alpha tend vers zéro on doit tenir compte des liens qui lient les
% sites donc le calcul est plus compliqué et long que lorsque alpha vaut 1
% et dans ce cas, la probabilité d'être sur une page est égale pour chaque
% page.
figure ;
plot(Alpha, I, 'c');
title('Evolution du nombre d iterations en fonction d alpha ');
