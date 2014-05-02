

 file_c = load('test2_adjacency.mat');
 
 G = file_c.G;
    
 [k, ~] = size(G);
 % Compute 
 Q1 = getRandomQTeleport(G, 0.50); % surfer 1
 Q2 = getRandomQTeleport(G, 0.50); % surfer 2
 pi_0 = zeros(k, 1);
 pi_0(1) = 1;
 
 n = 200; % number of traces
 m = 100; % trace size
 
 %% Estimations of Q
 Tr_est1 = GenMarkov(Q1, pi_0, m).';
 Tr_est2 = GenMarkov(Q2, pi_0, m).';
 
 Q_est1 = estimateQ(Tr_est1,k);
 Q_est2 = estimateQ(Tr_est2,k);
 
 %% Trace that must be evaluated
 Trmat = zeros(n, m);
 
 count_Q1 = 0;
 for i = 1:n
    if i <= (n / 2)
        count_Q1 = count_Q1 + 1;
        Trmat(i,:) = GenMarkov(Q1, pi_0, m).';
    else
        Trmat(i,:) = GenMarkov(Q2, pi_0, m).';
    end
 end
 
 Q = zeros(2,k,k);
 Q(1,:,:) = Q_est1;
 Q(2,:,:) = Q_est2;
 
 %% Computation of likelihood and origin
 p = getLogLikelihood(Q, Trmat);
 
 P_Q1 = count_Q1/n;
 P_Q2 = 1 - P_Q1;
 
 o = getOrigin(Q,Trmat,[P_Q1 P_Q2]);
 
 