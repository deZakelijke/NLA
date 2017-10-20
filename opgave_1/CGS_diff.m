% Made by Micha de Groot

function [Q,R] = CGS_diff(A)
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
    for i = 1:n
        R(i,i) = norm(V(:,i));
        Q(:,i) = V(:,i)/R(i,i);
        for j = i+1:n
            R(i,j) = dot(Q(:,i), A(:,j));
            V(:,j) = V(:,j) - R(i,j)*Q(:,i);
        end
    end

end
