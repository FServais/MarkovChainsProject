function pi_n = getDensityAtN(pi_0, Q, N)
%getDensityAtN compute the probability density at the Nth iteration
%   [pi_n] = getDensityAtN(pi_0, Q, N) : if pi_0 is an initial probability
%   density, Q a transition matrix and N an integer greater than 0, pi_n 
%   is the probability distribution at the Nth iteration
    pi_n = pi_0 * Q^N;
end