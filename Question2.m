%       QUESTION 2.1 : Estimation de la matrice de transiton

%% Question 2.1.3
L = load('traces.mat');

Trmat = L.Trmat;
Tr1 = L.Tr1;
Tr2 = L.Tr2;
G = L.G;
n = 50;

Tr = [Tr1; Tr2];

% Modèles pour les traces
Q1 = estimateQ(Tr1, 50);
Q2 = estimateQ(Tr2, 50);

Q = zeros(2,n,n);
Q(1,:,:) = Q1;
Q(2,:,:) = Q2;

[o, r] = getOrigin(Q, Trmat, [0.5 0.5]);
