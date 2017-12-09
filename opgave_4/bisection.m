function [Q, L] = bisection(D, beta, z)
%TODO Rekening houden met het laatste nulpunt, met beta
    [m, n] = size(D);
    L = zeros(m, n);
    Q = zeros(m, n);
    for i = 1:n-1
        d1 = D(i,i);
        d2 = D(i+1, i+1);
        l = (d1 + d2) / 2;
        while abs(secular(l, beta, z(i), d1, d2)) > 10^(1)
            disp(l)
            if secular(l, beta, z(i), d1, d2) > 0
                d1 = l;
                l = (d1 + d2) / 2;
            else
                d2 = l;
                l = (d1 + d2) / 2;
            end
        end
        disp(secular(l, beta, z(i), d1, d2))
        if beta > 0
            L(i, i) = l
        else
            L(i+1, i+1) = l
        q = null(D, (beta*z)*z' - l*eye(n))
        %Q(:, i) = q;
    end

    

end
