function Qt = getQTeleport(A, alpha)
% Returns the transition matrix taking into account that
% the surfer might jump to a random page (with a probability
% of alpha)
%
% @param A the adjacency matrix of the graph
% @param alpha the probability that the surfer jumps
%
% @return Qt the transition matrix
    n = size(A, 1);
    Qtemp = ones(n, n) ./ n;
    Q = AdjDN2Q(A);
    Qt = Q .* (1 - alpha) + Qtemp .* alpha;
end