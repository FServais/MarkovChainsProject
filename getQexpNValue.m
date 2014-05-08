function [ value ] = getQexpNValue(Q, n, i, j)
%getQexpNValue Returns the value at indexes (i,j) of matrix Q^n
    Qn = Q^n;
    value = Qn(i,j);
end

