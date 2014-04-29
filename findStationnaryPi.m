function [pi_s, i] = findStationnaryPi(Q, pi_0, tol, max_iter)
%findStationnaryPi compute the stationnary distribution for a transition
%matrix starting with a given ditribution
%   [pi_s, i] = findStationnaryPi(Q, pi_0) : if Q is a transition matrix
%   and pi_0 the starting distribution, then pi_s is the sationnary
%   distribution and i is the number of iteration to reach this
%   distribution
%   [pi_s, i] = findStationnaryPi(Q, pi_0, tol) : performs the same
%   computation except that the maximum error between two consecuting
%   distribution is less than tol (default value for tol : 10^-10)
%   [pi_s, i] = findStationnaryPi(Q, pi_0, tol, max_iter) : performs the
%   same computation except that the computations stops when max_iter is
%   reached (default value for max_iter : 10000)

	if (nargin == 2)
		max_iter = 10000;
		tol = 10^-10;
	elseif (nargin == 3)
		max_iter = 10000;
    elseif (nargin ~= 4)
        error('Invalid number of arguments');
	end

    pi_prev = pi_0;
    pi_curr = pi_0 * Q;
    i = 1;

    while and(max(abs(pi_curr - pi_prev)) > tol, i < max_iter)
        pi_prev = pi_curr;
        pi_curr = pi_curr * Q;
        i = i + 1;
    end

    pi_s = pi_curr;
end