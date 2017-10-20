

    h_list = zeros(7,1);
    g_list = zeros(7,1);

for n = 4:10
    A = hilb(n);

    [Q,R] = MGS(A);
    n_1 = norm((eye(n)- Q'*Q), inf);
    g_list(n-3, 1) = n_1;

    [Q,R] = house(A);
    n_2 = norm((eye(n) - Q'*Q), inf);
    h_list(n-3, 1) = n_2;

end


semilogy(g_list, '-r*')
hold on
legend('MGS', 'Householder');
semilogy(h_list, '-o')

