function Qt = getQTeleport(A, alpha)
%getQTeleport compute the transition matrix taking into account that the
%surfer might jump with a probability alpha
%   Qt = getQTeleport(A, alpha) : if A is an adjancency matrix and alpha is
%   the probability that the surfer jumps, then Qt is the transition matrix
    n = size(A, 1);
    Qtemp = ones(n, n) ./ n;
    Q = AdjDN2Q(A);
    Qt = Q .* (1 - alpha) + Qtemp .* alpha;
end