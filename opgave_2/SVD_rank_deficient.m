function x = SVD_rank_deficient(E_list,b)
    E_3 = E_list(:,1:2);
    E_6 = E_list(:,3:4);
    E_9 = E_list(:,5:6);
    E_12 = E_list(:,7:8);
    E_15 = E_list(:,9:10);


    [U,S,V] = svd(E_3);
    A_1 = U(:,1)*S(1,1)*V(:,1)';
    x = A_1\b;
    disp(sprintf('x_1 for SVD regularization of (A+E_e3)\\b: %d', x(1)));
    disp(sprintf('x_2 for SVD regularization of (A+E_e3)\\b: %d\n', x(2)));

    [U,S,V] = svd(E_6);
    A_1 = U(:,1)*S(1,1)*V(:,1)';
    x = A_1\b;
    disp(sprintf('x_1 for SVD regularization of (A+E_e6)\\b: %d', x(1)));
    disp(sprintf('x_2 for SVD regularization of (A+E_e6)\\b: %d\n', x(2)));

    [U,S,V] = svd(E_9);
    A_1 = U(:,1)*S(1,1)*V(:,1)';
    x = A_1\b;
    disp(sprintf('x_1 for SVD regularization of (A+E_e9)\\b: %d', x(1)));
    disp(sprintf('x_2 for SVD regularization of (A+E_e9)\\b: %d\n', x(2)));

    [U,S,V] = svd(E_12);
    A_1 = U(:,1)*S(1,1)*V(:,1)';
    x = A_1\b;
    disp(sprintf('x_1 for SVD regularization of (A+E_e12)\\b: %d', x(1)));
    disp(sprintf('x_2 for SVD regularization of (A+E_e12)\\b: %d\n', x(2)));

    [U,S,V] = svd(E_15);
    A_1 = U(:,1)*S(1,1)*V(:,1)';
    x = A_1\b;
    disp(sprintf('x_1 for SVD regularization of (A+E_e15)\\b: %d', x(1)));
    disp(sprintf('x_2 for SVD regularization of (A+E_e15)\\b: %d\n', x(2)));

end
