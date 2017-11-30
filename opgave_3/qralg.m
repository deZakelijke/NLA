% Made by Micha de Groot
% Perfroms the unshifted QR algorithm on matrix T
% T has to be tridiagonalized.

function Tnew = qralg(T)
    [m,n] = size(T);
    if m ~= n;
        error('Matrix is not square')
        return
    end
    Tnew = T;

    while abs(Tnew(2,1)) > 10^-12
        [Q,R] = tridiag_givens(Tnew);
        Tnew = R*Q;
        disp(abs(Tnew(2,1)))
    end

end
