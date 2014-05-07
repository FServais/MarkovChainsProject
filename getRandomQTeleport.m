function Q = getRandomQTeleport(A, alpha)
    % Get teleportation matrix
    [n, ~] = size(A);
    
    Q_tilde = getRandomDistribMat(ones(n,n));
    Q_prime = getRandomDistribMat(A);
    
    Q = (1 - alpha) * Q_prime + alpha * Q_tilde;
end

%% nested
function mat = getRandomDistribMat(bool_mat)
%getRandomDistribMat 
    [n, m] = size(bool_mat);
    mat = zeros(n,m);
    
    for i = 1:n
       mat(i,:) = getRandomDistrib(bool_mat(i,:));
    end
end

function v = getRandomDistrib(bool_vec)
%getDistrib create a row vector that sums to 1
%   v = getRandomDistrib(A_vec) : if bool_vec is a row vector containing only
%   ones and zeros, then v is a vector of which the it element is 0 if the
%   ith element of bool_vec was 0, or a real number between 0 and 1 otherwise
%   => v sums to 1
    n = length(bool_vec);
    v = zeros(1,n);
    ind = find(bool_vec == 1);
    remain = 1;
    for i = ind 
        if bool_vec(i) ~= 0
            if i ~= ind(end)
                nb = mod(rand(), remain);
                remain = remain - nb;
                v(i) = nb;
            else
                v(i) = remain;
            end
        end
    end
end