function [Q, L] = bisection(D, beta, z)
%TODO Rekening houden met het laatste nulpunt, met beta
    [m, n] = size(D);
    d = sort(diag(D))
    L = zeros(m, n);
    Q = zeros(m, n);
    for i = 1:n-1
        %d1 = D(i,i);
        %d2 = D(i+1, i+1);
        d1 = d(i);
        d2 = d(i+1);
        l = (d1 + d2) / 2;
        while abs(secular(l, beta, z, d)) > 10^(0)
            sec = secular(l, beta, z, d);
            if sec > 0 && beta < 0
                d1 = l;
                l = (d1 + d2) / 2;
            elseif sec > 0 && beta < 0
                d2 = l;
                l = (d1 + d2) / 2;
            elseif sec < 0 && beta > 0
                d1 = l;
                l = (d1 + d1) / 2;
            else
                d2 = l;
                l = (d1 + d1) / 2;
            end
        end
        if beta > 0
            L(i, i) = l;
        else
            L(i+1, i+1) = l;
        q = null(D, (beta*z)*z' - l*eye(n));
        %Q(:, i) = q;
    end

    

end
