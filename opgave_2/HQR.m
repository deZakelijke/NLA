function [x_14] = HQR(A,b)
    [Q,R] = qr(A,0);
    y = Q'*b;
    x = R\y;

    disp(['X_14 with regular hh: ', x(15)]);

    [Q,R] = qr([A b], 0);
    x = R(:, 1:15)\R(:, end);

    disp("X_14 with augmented hh: ", x(15));
end
