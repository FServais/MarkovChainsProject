% Returns the probability to be at state p2 at time t2 knowing that
% - we were at state p1 at t1 (t1 < t2)
% - we wiil be at state p3 at t3 (t3 > t2 > t1)
% @param Q transition matrix
% @param t1, t2, t3 Times (t3 > t2 > t1)
% @param p1, p2, p3 States 
function [ prob ] = getProbWithPastAndFut(Q, t1, p1, t2, p2, t3, p3)
    prob = getQexpNValue(Q, t3-t2, p2, p3) * getQexpNValue(Q, t2-t1, p1, p2) / getQexpNValue(Q, t3-t1, p1, p3);  
end

