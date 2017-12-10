% Made by Micha de Groot
% Program that calculates the eigenvalues and eigenvectors of a tridiagonal
% matrix T by using a divide and conquer approach.

% The bisection method doesn't seem to work for hilb(4) matrices; the roots of
% the secular equation don't seem to shrink beyond 10^-16.
% At this point both edges are the same for at least 16 digits. Any difference
% after that doesn't seem to have any effect when updating lambda.
% For other random symmetric matrices the convergence stops earlier.
% This usually causes the matrix (D-lI) to be nonsingular, making it impssible
% to calculate the  associated eigenvectors.

% Unfortunately this limits the testing of the recursion in this method since
% there aren't any resulting eigenvalues even for a 2x2 matrix.

function [L,Q] = DandC(T)
    [m,n] = size(T);

    % Base case for the recursion 
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
    % If bisection works the above two lines can be replaced with
    % the two below to make the function recursive and independent
    % of other eigenvalue algorithms.
    %[Q1, D1] = DandC(T1);
    %[Q2, D2] = DandC(T2);


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

    % Use bisection method
    [Q, L] = bisection(D, beta, z)

    % Can be rremoved if bisection works.
    [Q,L] = eig(D);
end
