% ==== Premi�re partie du projet ====

%       QUESTION 1 : Etude du mod�le de base

% matrice d'ajacence 1
A1 = [0 0 1 1;
     1 0 0 0;
     1 1 0 1;
     1 1 0 0];
 
 view(biograph(A1))
 %% Question 1.1.1
 
 
 %% Question 1.1.2
 Q = uniformQFromAdjacency(A1);
 
 %% Question 1.1.3
 pi_0_unif = [0.25 0.25 0.25 0.25];
 pi_0_A = [1 0 0 0];
 
 max_iter = 20;
 
 pi_unif = getDensityFrom0ToN(pi_0_unif, Q, max_iter);
 pi_A = getDensityFrom0ToN(pi_0_A, Q, max_iter);
 
 hold on;
 plot(pi_unif(1,:));
 plot(pi_unif(2,:));
 plot(pi_unif(3,:));
 plot(pi_unif(4,:));
 
 figure;
 hold on;
 plot(pi_A(1,:));
 plot(pi_A(2,:));
 plot(pi_A(3,:));
 plot(pi_A(4,:));
 
 %% Question 1.1.4
 pi_stationnaire = pi_unif(:, end);
 
 %% Question 1.1.5
 T = 30;
 X = GenMarkov(Q, pi_0_unif, T);
 
 figure;
 plot(X);
 axis([0 30 0 5]);
  
 %%       QUESTION 2 : T�l�portation
 data = load('graphes.mat');
 G = data.G;
 U = data.U;
 clear data;
 
 %% Question 1.2.1
 A2 = [0 1 0 0;
       0 0 0 1;
       1 1 0 0;
       1 0 0 0];
 
 A3 = [0 1 0 0 0;
       1 0 0 0 0;
       0 1 0 1 1;
       0 0 0 0 1;
       0 0 0 1 0],
 
 % display graph
 %view(biograph(A2));
 % view(biograph(A3)); 
 
 % transition
 Q2 = uniformQFromAdjacency(A2);
 Q3 = uniformQFromAdjacency(A3);
 
 % pi_0
 pi_init_2_u = ones(1,4) / 4; 
 pi_init_3_u = ones(1,5) / 5;
 %pi_init_2_1 = [1 0 0 0];
 %pi_init_3_1 = [1 0 0 0 0];
 
 % density at step k
 pi_2_u = getDensityFrom0ToN(pi_init_2_u, Q2, max_iter);
 % pi_2_1 = getDensityFrom0ToN(pi_init_2_1, Q2, max_iter);
 pi_3_u = getDensityFrom0ToN(pi_init_3_u, Q3, max_iter);
 % pi_3_1 = getDensityFrom0ToN(pi_init_3_1, Q3, max_iter);
%  
%  close all;
%  figure;
%  hold on;
%  plot(pi_2_u(1,:), 'k');
%  plot(pi_2_u(2,:), 'c');
%  plot(pi_2_u(3,:), 'r');
%  plot(pi_2_u(4,:), 'g');
 
%  figure;
%  hold on;
%  plot(pi_2_1(1,:));
%  plot(pi_2_1(2,:), 'c');
%  plot(pi_2_1(3,:), 'r');
%  plot(pi_2_1(4,:), 'g');
 
%  figure;
%  hold on;
%  plot(pi_3_u(1,:), 'k');
%  plot(pi_3_u(2,:), 'c');
%  plot(pi_3_u(3,:), 'r');
%  plot(pi_3_u(4,:), 'g');
%  plot(pi_3_u(5,:), 'b');
 
%  figure;
%  hold on;
%  plot(pi_3_1(1,:));
%  plot(pi_3_1(2,:), 'c');
%  plot(pi_3_1(3,:), 'r');
%  plot(pi_3_1(4,:), 'g');
%  plot(pi_3_u(5,:), 'y');
close all;
T = 30;
X2 = GenMarkov(Q2, pi_init_2_u, T);
X3 = GenMarkov(Q3, pi_init_3_u, T);
figure;
plot(X2);
axis([0 T 0 5]);
figure;
plot(X3);
axis([0 T 0 6]);

%% Q.1.2.2
pi_2_u(:,20:25);

