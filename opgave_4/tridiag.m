% Made by Micha de Groot
% Transfomrs square matrix a to a tridiagonal matrix
% Transformation is done with Householder reflectors

function T = tridiag(A)
    [m,n] = size(A);
    if m ~= n
        error('Matrix is not square')
        T = 0;
        return
    end

    T = A;
    for k = 1:m-2
        x = T(k+1:m, k);
        s = sign(x(1,:));
        if ~s
            s = 1;
        end
        e = zeros(m-k, 1);
        e(1,1) = 1;
        V = s*norm(x)*e + x;
        V = V/norm(V);

        T(k+1:m,k:m) = T(k+1:m,k:m) - 2*V*(V'*T(k+1:m,k:m));
        T(1:m,k+1:m) = T(1:m,k+1:m) - 2*(T(1:m,k+1:m)*V)*V';
    end
end
