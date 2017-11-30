% Made by Micha de Groot
% Calculates the QR decomposition of tridiagonal matrix A

function [Q,R] = tridiag_givens(A)
    [m,n] = size(A);
    Q = eye(m);
    R = A;

    for i=1:m-1
        r = sqrt(R(i,i)^2 + R(i+1, i)^2);
        c = R(i,i)/r;
        s = -R(i+1,i)/r;
        Q_1 = eye(m);
        Q_1(i,i) = c;
        Q_1(i+1,i+1) = c;
        Q_1(i,i+1) = -s;
        Q_1(i+1,i) = s;
        R = Q_1*R;
        Q = Q*Q_1';
    end
end
