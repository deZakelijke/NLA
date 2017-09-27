% Made by Micha de Groot

function [Q,R] = MGS_diff(A)
    if ~ismatrix(A)
        disp('Input is not a matrix');
        return 
    end

    [m,n] = size(A)
    if n > m;
        disp('More columns than rows.');
        return
    end

    V = A;
    Q = zeros(m,n);
    R = zeros(n);

    for i = 1:n
        R(i,i) = norm(V(:,i));
        Q(:,i) = V(:,i) / R(i,i);
        for j = i+1:n
            R(i,j) = dot(Q(:,i), V(:,j));
            V(:,j) = V(:,j) - R(i,j)*Q(:,i);
        end
    end
end
