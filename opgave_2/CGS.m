% Made by Micha de Groot

function [Q,R] = CGS(A)
    if ~ismatrix(A)
        disp('Input is not a matrix')
        return 
    end

    [m, n] = size(A);
    if n > m
        disp('More columns than rows.')
        return
    end

    V = A;
    R = zeros(n);
    Q = zeros(m,n);
    for j = 1:n
        for i = 1:j-1
            R(i,j) = dot(Q(:,i), A(:,j));
            V(:,j) = V(:,j) - R(i,j)*Q(:,i);
        end
        R(j,j) = norm(V(:,j));
        Q(:,j) = V(:,j)/R(j,j);
    end

end
