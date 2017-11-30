% Made by Micha de Groot
% Perfroms the unshifted QR algorithm on matrix T
% T has to be tridiagonalized.
% There are three options, without shift, with Rayleigh quotient shift and with Wilkinson shift.

function [Tnew, errors, iterations] = qralg(T, option1)
    [m,n] = size(T);
    if m ~= n;
        error('Matrix is not square')
        return
    end
    Tnew = T;
    errors = abs(Tnew(2,1));
    iterations = 0;

    % Without shifts
    if option1 == 0
        while abs(Tnew(2,1)) > 10^-12
            [Q,R] = tridiag_givens(Tnew);
            Tnew = R*Q;
            errors = [errors, abs(Tnew(2,1))];
            iterations = iterations + 1;
        end

    % With Rayleigh Quotient shifts
    elseif option1 == 1
        I = eye(m);
        while abs(Tnew(2,1)) > 10^-12
            mu = T(m,m);
            [Q,R] = tridiag_givens(Tnew - mu*I);
            Tnew = R*Q + mu*I;
            errors = [errors, abs(Tnew(2,1))];
            iterations = iterations + 1;
        end

    % With Wilkinson shifts
    elseif option1 == 2
        I = eye(m);
        while abs(Tnew(2,1)) > 10^-12
            delta = (Tnew(m-1,m-1) - Tnew(m,m))/2;
            s = sign(delta);
            if ~s
                S = 1;
            end
            b = Tnew(m,m-1);
            mu = Tnew(m,m) - s*b^2 / (abs(delta) + sqrt(delta^2+b^2));
            [Q,R] = tridiag_givens(Tnew - mu*I);
            Tnew = R*Q + mu*I;
            errors = [errors, abs(Tnew(2,1))];
            iterations = iterations + 1;
        end

    else
        disp('Not a valid shift option');
        return
    end
end
