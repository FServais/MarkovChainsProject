U = load('traces.mat');
G = U.G;
Tr1 = U.Tr1;
Tr2 = U.Tr2;
 
k = 50; % graph size

Q = getQTeleport(G, 0.5);

%Q1 = getQTeleport(G, 0.3);
%Q2 = getQTeleport(G, 0.7);
pi_0 = [1 0 0 0 0 0 0];

n = 100; % number of traces
m = 300; % trace size

    X = zeros(n,m);
    %X1 = zeros(n,m);
    %X2 = zeros(n,m);
    Q_est = zeros(n,k,k);
    E = zeros(k,k);

    % for i =1:n
    %     X1(i,:) = GenMarkov(Q1, pi_0, m);
    %     X2(i,:) = GenMarkov(Q2, pi_0, m);
    % end
    % 
    % Q = zeros(2,k,k);
    % Q(1,:,:) = Q1;
    % Q(2,:,:) = Q2;
    % 
    % o = getOrigin(Q, [X1 ; X2], [0.5 0.5]);
    % length(find(o==1))
    % length(find(o==2))

    for i = 1:n
        X(i,:) = GenMarkov(Q, pi_0, m);
        Q_est(i,:,:) = estimateQ(X(i,:), k);
        E = E + Q - squeeze(Q_est(i,:,:));
    end

    E = squeeze(var(Q_est)) + (E./n).^2;
    disp(sprintf('m = %d : %g', m, mean(mean(E))));    
