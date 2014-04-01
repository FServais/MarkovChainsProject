function pi_s = findStationnaryPi(Q, pi_0, max_iter)
    pi_prev = pi_0;
    pi_curr = pi_0 * Q;
    i = 2; 
    % while counter is less than max iter AND
    %       pi is not stationnary
    while (max(abs(pi_curr - pi_prev)) > 10^-4)
        %disp(max(abs(pi_curr - pi_prev)));
        pi_prev = pi_curr;
        pi_curr = pi_curr * Q;
        i = i + 1;
    end
    
    pi_s = pi_curr;
end