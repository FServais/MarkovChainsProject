function pi_s = findStationnaryPi(Q, pi_0)
    pi_prev = pi_0;
    pi_curr = pi_0 * Q;
    % while 
    %       pi is not stationnary
    while (max(abs(pi_curr - pi_prev)) > 10^-10)
        pi_prev = pi_curr;
        pi_curr = pi_curr * Q;
    end
    pi_s = pi_curr;
end