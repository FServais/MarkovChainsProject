function Qest = estimateQUnigramPrior(X,k,m)
%estimateQJalinekMercer returns an estimation of the transition matrix
%for the given markov chain
%   Qest = estimateQUnigramPrior(X,k,m) : if X is a markov chain, k
%   the order of the graph, m the smoothing factor,
%   then Qest is the estimated matrix built by the MLE method (an
%   by applying the Unigram prior smoothing)

% Unigram priority
s = sum(Tr,2);
m = 2 * k;

Q = zeros(k,k);
for i=1:size(Tr,2)
    for j=1:size(Tr,1)
        Tr(i,j) = (Tr(i,j) + m*s(j)/length(X))/(s(i)+m);
    end
end

Q = Tr;

end

