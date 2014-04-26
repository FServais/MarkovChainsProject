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
count1 = 0;
count2 = 0;
countEqual = 0;

for i=1:size(Trmat,1)
    row = Trmat(i,:);
    probFromQ1 = logProbOfSequence(row, Q1);
    probFromQ2 = logProbOfSequence(row, Q2);
    
    if probFromQ1 > probFromQ2
        count1 = count1 + 1;
    elseif probFromQ1 == probFromQ2
        countEqual = countEqual + 1;
    else
        count2 = count2 + 1;
    end
end