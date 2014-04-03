function pi_s = findStationnaryPi(Q, pi_0, tol, max_iter)
% Returns the stationnary vector of probability for each state
% of the graph
%
% @param Q the transition matrix
% @param pi_0 the intial probability distribution
% @param tol (optional) the max variation of one probability from one step to another
% @param max_iter (optional) the max number of iteration 
%
% @return pi the vector containing the stationnary distribution

	if (nargin == 2)
		max_iter = 10000;
		tol = 10^-10;
	elseif (nargin == 3)
		max_iter = 10000;
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