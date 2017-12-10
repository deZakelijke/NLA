% Made by Micha de Groot

function [L,Q] = DandC(T)
    [m,n] = size(T);
    if (m == 1)
        L = T;
        Q = eye(1);
        return
    end

    k = cast(n/2, 'uint8');
    e_1 = zeros(k,1);
    e_1(1,1) = 1;
    e_k = zeros(n-k,1);
    e_k(k,1) = 1;
    beta = T(k+1,k);

    T1 = T(1:k, 1:k) - beta*e_k*e_k';
    T2 = T(k+1:n, k+1:n) - beta*e_1*e_1';
    [Q1, D1] = eig(T1);
    [Q2, D2] = eig(T2);


    z = zeros(1,n);
    z(1,1:k) = Q1'*e_k;
    z(1,k+1:n) = Q2'*e_1;
    z = z';

    Q = zeros(n,n);
    Q(1:k, 1:k) = Q1;
    Q(k+1:n, k+1:n) = Q2;

    D = zeros(n,n);
    D(1:k, 1:k) = D1;
    D(k+1:n, k+1:n) = D2
    %D = D + (beta*z)*z'

    % Doe bisectie methode
    [Q, L] = bisection(D, beta, z);

    [Q,L] = eig(D);
end
