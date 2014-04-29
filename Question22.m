L = load('traces.mat');

Trmat = L.Trmat;
Tr1 = L.Tr1;
Tr2 = L.Tr2;
G = L.G;
n = 50;

Q1 = estimateQ(Tr1, 50);
Q2 = estimateQ(Tr2, 50);

Q_temp = AdjDN2Q(G);

[alpha, alpha_m] = estimateAlpha(Trmat, G);
%p = getLogLikelihood(Q, Trmat);
