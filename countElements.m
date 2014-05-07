function [ countOfCounts ] = countElements( vector, min_size )
% Return a column (vector) containing the number of times the value of the
% index was counted.
% 
% @param counts Vector.
% @param min_size Minimun size of the returned vector, 0 by default.
%
% @return countOfCounts
    countOfCounts = zeros(max(min_size,max(vector)),1);
    for i=1:length(vector)
        countOfCounts(vector(i)) = countOfCounts(vector(i)) + 1;
    end
end

