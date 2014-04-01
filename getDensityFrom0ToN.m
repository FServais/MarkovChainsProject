% Returns a matrix containing, at the ith column, the probability density
% pi_i
% @param pi_0 initial probablility density
% @param Q transition matrix
% @param i number of iteration
function pi = getDensityFrom0ToN(pi_0, Q, n)
    pi = zeros(length(pi_0), n);
    pi(:,1) = pi_0;
    
    for i = 2:n
        pi(:,i) = pi(:, i - 1).' * Q;
    end
end