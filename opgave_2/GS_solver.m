% Made by Micha de Groot

% solves the system Ax=b using various kinds of Gram Schmidt

function x_14 = GS_solver(A,b)
    [Q,R] = MGS(A);
    y = Q'*b;
    x = R\y;

    disp(sprintf('X_14 with modified Gram Schmidt: %d', x(15)));

    [Q,R] = qr([A b], 0);
    x = R(:, 1:15)\R(:, end);

    disp(sprintf('X_14 with modified Gram Schmidt of augmented matrix A|b: %d', x(15)));
    x_14 = x(15);


    [Q,R] = CGS(A);
    y = Q'*b;
    x = R\y;

    disp(sprintf('X_14 with classical Gram Schmidt: %d', x(15)));

    [Q,R] = qr([A b], 0);
    x = R(:, 1:15)\R(:, end);

    disp(sprintf('X_14 with classical Gram Schmidt of augmented matrix A|b: %d', x(15)));
    x_14 = x(15);


end
