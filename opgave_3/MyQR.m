% Made by Micha de Groot
% This program calculates the eigenvalues of a matrix A.
% There are several options for the QR algorithm.
% A plot of the remainder after each iteration can be made to see 
% the convergence speed.

function eigenvalues = MyQR(A, option1, option2)
    [m,n] = size(A);
    I = eye(m,m);

    T = tridiag(A);
    [Diagonal, errors, iterations] = qralg(T, option1);

    eigenvalues = diag(Diagonal);
    sprintf('The QR algorithm took %d iterations', iterations)
    %disp(errors);

    if option2 == 1
        semilogy(errors);
    end

end
