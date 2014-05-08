k = 50;
A = getRandomAdjacency(k, 0.50);
Q = getQTeleport(A, 0.5);
Q1 = getQTeleport(A, 0.2);
Q3 = getQTeleport(A, 0.7);
X = [GenMarkov(Q, ones(k,k) / k, 2000).';
     GenMarkov(Q1, ones(k,k) / k, 2000).';
     GenMarkov(Q3, ones(k,k) / k, 2000).'];


estimateAlpha2(X,A,0.001)