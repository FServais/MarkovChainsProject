function A = getRandomAdjacency(n, thresh)
%getRandomAdjancency create a random adjacency matrix
%   A = getRandomAdjancency(n, tresh), if n is a positive integer, thresh a
%   real number between 0 and 1, then A is an adjacency matrix of size 
%   (n x n) (it doesn't contain any 1 on its main diagonal) and of each
%   element has approximatly a probability thresh to be 0
    A = rand(n,n) > thresh;
    A = A - diag(diag(A));
end