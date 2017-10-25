function [x_14] = HQR(A,b)
    [Q,R] = qr(A,0);
    y = Q'*b;
    x = R\y;

    disp(sprintf('X_14 with regular hh: %d', x(15)));

    [Q,R] = qr([A b], 0);
    x = R(:, 1:15)\R(:, end);

    disp(sprintf('X_14 with augmented hh: %d', x(15)));
    x_14 = x(15);
end
