k = 7; % graph order

A1 = [0 1 1 0 0 1 1;
      0 0 0 1 0 0 0;
      1 1 0 0 0 0 0;
      0 0 0 0 1 0 0;
      1 0 0 0 0 0 1;
      0 1 0 1 0 0 0;
      0 0 0 0 1 1 0];
 
A2 = [0 0 0 0 0 0 1;
      0 0 0 1 1 0 0;
      0 1 0 0 0 0 0;
      0 0 1 0 1 0 0;
      1 0 1 0 0 0 1;
      0 1 0 1 1 0 0;
      0 1 1 0 0 1 0];

 % Compute 
 Q1 = getQTeleport(A1, 0.15);
 Q2 = getQTeleport(A2, 0.15);
 pi_0 = ones(1,k) / k;
 
 n = 1; % number of traces
 m = 140; % trace size
 
 Tr_est1 = GenMarkov(Q1, pi_0, m).';
 Tr_est2 = GenMarkov(Q2, pi_0, m).';

%  a = countTransitions(Tr_est1, k);
%  b = countTransitions(Tr_est2, k);
%  
%  a = a + ones(k,k)
%  b = b + ones(k,k)
% 
%  Q_est1 = a ./ repmat(sum(a, 2), 1, k)
%  Q_est2 = b ./ repmat(sum(b, 2), 1, k)
 
 Q_est1 = estimateQ(Tr_est1,k);
 Q_est2 = estimateQ(Tr_est2,k);
 
 Tr1 = GenMarkov(Q1, pi_0, m).';
 Tr2 = GenMarkov(Q1, pi_0, m).';
 Tr3 = GenMarkov(Q2, pi_0, m).';
 Tr4 = GenMarkov(Q2, pi_0, m).';
 Tr5 = GenMarkov(Q1, pi_0, m).';
 Tr6 = GenMarkov(Q1, pi_0, m).';
 Tr7 = GenMarkov(Q2, pi_0, m).';
 Tr8 = GenMarkov(Q2, pi_0, m).';
 
 Tr = [Tr1; Tr2; Tr3; Tr4; Tr5; Tr6; Tr7; Tr8];
 
 Q = zeros(2,k,k);
 Q(1,:,:) = Q_est1;
 Q(2,:,:) = Q_est2;
 
 p = getLogLikelihood(Q, Tr);
 
 getOrigin(Q,Tr,[0.5 0.5])
 
 