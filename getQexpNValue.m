% Returns the value at indexes (i,j) of matrix Q^n
% @param Q transition matrix
% @param n Exponent
% @param i Row
% @param j Column
function [ value ] = getQexpNValue(Q, n, i, j)
    Qn = Q^n;
    value = Qn(i,j);
end

