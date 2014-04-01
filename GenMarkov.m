function X=GenMarkov(Q,p0,n)
% generate a sample of a Markov Chain with transition matrix Q and initial
% distribution p0
% V. Denoël, Jan 2014

X = zeros(n,1);

p=p0;
for i=1:n
    X(i) = GenStep(p0);
    p0   = Q(X(i),:);
end

end

%% Nested functions
function i=GenStep(p)
v = rand(1,1);
c = cumsum(p);
i=1;

while v>c(i)
    i=i+1;
end

end