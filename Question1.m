%       QUESTION 1 : Etude du mod�le de base

%        1) Analyse de la matrice A1

% Matrice d'ajacence 1
A1 = [0 0 1 1;
    1 0 0 0;
    1 1 0 1;
    1 1 0 0];

%% Question 1.1.1
view(biograph(A1))

%% Question 1.1.2
Q = Adj2Q(A1);

%% Question 1.1.3
pi_0_unif = [0.25 0.25 0.25 0.25];
pi_0_A = [1 0 0 0];

max_iter = 20;

pi_unif = getDensityFrom0ToN(pi_0_unif, Q, max_iter);
pi_A = getDensityFrom0ToN(pi_0_A, Q, max_iter);

r = [227 45 26]./255;
b = [61 73 245]./255;
g = [122 219 71]./255;
c = [0 197 221]./255;
y = [255 199 73]./255;

hold on;
plot(pi_unif(1,:),'Color', r, 'Marker', '.');
plot(pi_unif(2,:),'Color', b, 'Marker', '.');
plot(pi_unif(3,:),'Color', g,'Marker', '.');
plot(pi_unif(4,:),'Color', c, 'Marker', '.');

figure;
hold on;
plot(pi_A(1,:),'Color', r, 'Marker', '.');
plot(pi_A(2,:),'Color', b, 'Marker', '.');
plot(pi_A(3,:),'Color', g,'Marker', '.');
plot(pi_A(4,:),'Color', c, 'Marker', '.');

% Generate Q^t, t in [0, max_iter]
Q_t = zeros(size(Q,1), size(Q,2), max_iter);
Q_t(:,:,1) = Q;
for i=2:(max_iter)
    Q_t(:,:,i) = Q_t(:,:,i-1)*Q;
end

%% Question 1.1.4
pi_stationnaire = findStationnaryPi(Q, pi_0_unif, 10^-10);

%% Question 1.1.6
T_max = 50;
n_test = 1000;
res = zeros(n_test, 4, T_max);

for i = 1:n_test
    for j = 1:T_max
        X = GenMarkov(Q, pi_stationnaire, j);
        res(i,:,j) = hist(X, [1 2 3 4]) / j;
    end
end

figure;
hold on;
mean12 = squeeze(mean(res, 1));
plot(mean12(1,:),'Color', r, 'Marker', '.', 'DisplayName', 'Noeud 1');
plot(mean12(2,:),'Color', b, 'Marker', '.', 'DisplayName', 'Noeud 2');
plot(mean12(3,:),'Color', g, 'Marker', '.', 'DisplayName', 'Noeud 3');
plot(mean12(4,:),'Color', c, 'Marker', '.', 'DisplayName', 'Noeud 4');

xlabel('Nombre d''it�ration');
ylabel('Nombre de passage');
title('Evolution du nombre de passage en fonction du nombre d''it�ration');
legend('show');

%% Question 1.2 
% Analyse des matrices A2 et A3

A2 = [0 1 0 0;
    0 0 0 1;
    1 1 0 0;
    1 0 0 0];

A3 = [0 1 0 0 0;
    1 0 0 0 0;
    0 1 0 1 1;
    0 0 0 0 1;
    0 0 0 1 0];

%% Question 1.2.1

% display graph
view(biograph(A2));
view(biograph(A3));

% transition
Q2 = Adj2Q(A2);
Q3 = Adj2Q(A3);

% pi_0
pi_init_2_u = ones(1,4) / 4;
pi_init_2_1 = [1 0 0 0];
pi_init_3_u = ones(1,5) / 5;
pi_init_3_1 = [1 0 0 0 0];

% density at step k
pi_2_u = getDensityFrom0ToN(pi_init_2_u, Q2, max_iter);
pi_2_1 = getDensityFrom0ToN(pi_init_2_1, Q2, max_iter);
pi_3_u = getDensityFrom0ToN(pi_init_3_u, Q3, max_iter);
pi_3_1 = getDensityFrom0ToN(pi_init_3_1, Q3, max_iter);

figure;
hold on;
plot(pi_2_u(1,:),'Color', r, 'Marker', '.', 'DisplayName', 'Noeud 1');
plot(pi_2_u(2,:),'Color', b, 'Marker', '.', 'DisplayName', 'Noeud 2');
plot(pi_2_u(3,:),'Color', g, 'Marker', '.', 'DisplayName', 'Noeud 3');
plot(pi_2_u(4,:),'Color', c, 'Marker', '.', 'DisplayName', 'Noeud 4');

title('Matrice A_2 : distribution initiale uniforme');
xlabel('pas (T)');
ylabel('Etats');
legend('show');

figure;
hold on;
plot(pi_2_1(1,:),'Color', r, 'Marker', '.', 'DisplayName', 'Noeud 1');
plot(pi_2_1(2,:),'Color', b, 'Marker', '.', 'DisplayName', 'Noeud 2');
plot(pi_2_1(3,:),'Color', g, 'Marker', '.', 'DisplayName', 'Noeud 3');
plot(pi_2_1(4,:),'Color', c, 'Marker', '.', 'DisplayName', 'Noeud 4');

title('Matrice A_2 : d�marrage du noeud 1');
xlabel('pas (T)');
ylabel('Etats');
legend('show');

figure;
hold on;
plot(pi_3_u(1,:),'Color', r, 'Marker', '.', 'DisplayName', 'Noeud 1');
plot(pi_3_u(2,:),'Color', b, 'Marker', '.', 'DisplayName', 'Noeud 2');
plot(pi_3_u(3,:),'Color', g, 'Marker', '.', 'DisplayName', 'Noeud 3');
plot(pi_3_u(4,:),'Color', c, 'Marker', '.', 'DisplayName', 'Noeud 4');
plot(pi_3_u(5,:),'Color', y, 'Marker', '.', 'DisplayName', 'Noeud 5');

title('Matrice A_3 : distribution initiale uniforme');
xlabel('pas (T)');
ylabel('Etats');
legend('show');

figure;
hold on;
plot(pi_3_1(1,:),'Color', r, 'Marker', '.', 'DisplayName', 'Noeud 1');
plot(pi_3_1(2,:),'Color', b, 'Marker', '.', 'DisplayName', 'Noeud 2');
plot(pi_3_1(3,:),'Color', g, 'Marker', '.', 'DisplayName', 'Noeud 3');
plot(pi_3_1(4,:),'Color', c, 'Marker', '.', 'DisplayName', 'Noeud 4');
plot(pi_3_1(5,:),'Color', y, 'Marker', '.', 'DisplayName', 'Noeud 5');

title('Matrice A_3 : d�marrage du noeud 1');
xlabel('pas (T)');
ylabel('Etats');
legend('show');

%%
T = 30;
X2 = GenMarkov(Q2, pi_init_2_u, T);
X3 = GenMarkov(Q3, pi_init_3_u, T);
figure;
plot(X2);
axis([0 T 0 5]);
figure;
plot(X3);
axis([0 T 0 6]);

%% Question 1.2.2
pi_2_u(:,16:20);



