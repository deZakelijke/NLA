% Made by Micha de Groot

function [Q,R] = MGS(A)
    if ~ismatrix(A)
        disp('Input is not a matrix')
        return 
    end

    [m,n] = size(A)
    if n > m
        disp('More columns than rows.')
        return
    end

    V = A
    Q = zeros(m,n)
    R = zeros(n)

    for j = 1:n
        for i = 1:j-1
            R(i,j) = dot(Q(:,i), V(:,j))
            V(:,j) = V(:,j) - R(i,j)*Q(:,i)
        end
        R(j,j) = norm(V(:,j))
        Q(:,j) = V(:,j) / R(j,j)
    end
end
