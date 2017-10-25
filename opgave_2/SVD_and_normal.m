function x_14 = SVD_and_normal(A,b)
    x = A\b;
    x_14 = x(15);
    disp(sprintf('X_14 with normal equations: %d', x(15)));

    [U, S, V] = svd(A);
    x = (S*V')\(U'*b);
    disp(sprintf('X_14 by using the SVD: %d', x(15)));
end
