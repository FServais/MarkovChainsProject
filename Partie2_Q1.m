clear all;
close all;

%       QUESTION 1 : Estimation de la matrice de transition

%% Initialisation
data = load('traces.mat');

G = data.G;
Tr1 = data.Tr1;
Tr2 = data.Tr2;
Trmat = data.Trmat;

clear data;

%% Question 2.1.3

Q1 = estimateQFromRealization(Tr1);
Q2 = estimateQFromRealization(Tr2);
