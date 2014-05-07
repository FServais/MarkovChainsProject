function pi = getDensityFrom0ToN(pi_0, Q, N)
%getDensityFrom0ToN compute the probability densities from the initial
%distribution to the Nth iteration
%   [pi] = getDensityFrom0ToN(pi_0, Q, N) : if pi_0 is a probability
%   distribution of size n, Q a transition matrix of size (n x n), N an
%   integer greater than 0, then pi is a matrix of size (n x N) containing
%   every probability density from step 0 to N

    pi = zeros(length(pi_0), N);
    pi(:,1) = pi_0;
    
    for i = 2:N
        pi(:,i) = pi(:, i - 1).' * Q;
    end
end