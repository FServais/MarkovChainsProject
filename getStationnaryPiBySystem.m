function [ X ] = getStationnaryPiBySystem( Q )
%GETSTATIONNARYPIWITHSYSTEM Function that give the stationnary
% pi from a given transition matrix by resolving the equation : 
% pi_s * Q = pi_s, where pi_s is the stationnary pi.

[V,D] = eig(Q');
tol = 10^(-9);

% Find indexes
index = find(abs(diag(D) - 1) < tol);

X = zeros(length(index), size(V,1));

for i=1:length(index)
    % Get the good eigen vector
    X(i,:) = V(:,index(i)).';
    
    % Normalize
    if(contains_negative(X(:,i)))
        X(i,:) = X(i,:)/norm(X(i,:),1) * -1;
    else
        X(i,:) = X(i,:)/norm(X(i,:),1);
    end
    
end

end



function [ bool ] = contains_negative( V )
%CONTAINS_NEGATIVE Function that return 1 if the vector V contains a
% negative element.

i=1;
bool = 0;

while i <= length(V) && ~bool
    if V(i) < 0
        bool = 1;
    end
    i = i+1;
end

end