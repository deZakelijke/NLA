% Made by Micha de Groot
% Calculates the eigenvalues of D + beta * z * z'
% The bisection method is used to find the roots of the
% secular equation.

function [Q, L] = bisection(D, beta, z)
    precision = 10^(-15);
    [m, n] = size(D);
    d = sort(diag(D));
    L = zeros(m, n);
    Q = zeros(m, n);
    for i = 1:n-1
        d1 = d(i);
        d2 = d(i+1);
        l = (d1 + d2) / 2;
        sec = secular(l, beta, z, d);
        
        % The closest approximations of the roots of the 
        % secular equation have an error of O(10^-15)
        while abs(secular(l, beta, z, d)) > precision
            %sprintf('l: %.20f', l)
            %sprintf('d1: %.20f', d1)
            %sprintf('d2: %.20f', d2)
            sec = secular(l, beta, z, d);
            if sec > 0 && beta < 0
                d1 = l;
                l = (d1 + d2) / 2;
            elseif sec > 0 && beta > 0
                d2 = l;
                l = (d1 + d2) / 2;
            elseif sec < 0 && beta > 0
                d1 = l;
                l = (d1 + d2) / 2;
            elseif sec < 0 && beta < 0
                d2 = l;
                l = (d1 + d2) / 2;
            else
                disp('Impossible case in binary search');
                break;
            end
            if sec == Inf
                disp('oi');
                break
            end
        end
        if beta > 0
            L(i, i) = l;
        else
            L(i+1, i+1) = l;
        end

        % Calculate the eigenvectors.
        % Since the eigenvalues are inprecise there isn't a nullspace
        q = null(D + (beta*z)*z' - l*eye(n))
        if beta > 0
            % Q(:, i) = q;
        else
            % Q(:, i+1) = q;
        end
    end

    % Remaining eigenvalue
    % Two options for the range in which it lies
    % depending on the sign of beta
    if beta > 0
        d1 = d(n);
        d2 = d(n) + beta*norm(z);
    else
        d1 = d(1) - abs(beta)*norm(z);
        d2 = d(1);
    end
    while abs(secular(l, beta, z, d)) > precision
        sec = secular(l, beta, z, d);
        if sec > 0 && beta < 0
            d1 = l;
            l = (d1 + d2) / 2;
        elseif sec > 0 && beta > 0
            d2 = l;
            l = (d1 + d2) / 2;
        elseif sec < 0 && beta > 0
            d1 = l;
            l = (d1 + d2) / 2;
        elseif sec < 0 && beta < 0
            d2 = l;
            l = (d1 + d2) / 2;
        else
            disp('Impossible case in binary search');
            break;
        end
        if sec == Inf
            disp('oi');
            break
        end
    end
    if beta > 0
        L(n, n) = l;
    else
        L(1, 1) = l;
    end
    % Calculate the eigenvectors.
    q = null(D + (beta*z)*z' - l*eye(n))
    if beta > 0
        % Q(:, i) = q;
    else
        % Q(:, i+1) = q;
    end

end
