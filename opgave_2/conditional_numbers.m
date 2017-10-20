% Made by Micha de Groot

% p = polyval(flipud(x), t)

% The conditional numbers c11 through c22 are:
% c11: conditioning of y with pertubations of b
% c12: conditioning of x with pertubations of b
% c21: conditioning of y with pertubations of A
% c22: conditioning of x with pertubations of A
function [c11, c12, c21 c22] = conditional_numbers(A, b)
    x = A\b;
    A_plus = (A'*A)\(A');
    P = A*A_plus;
    y = P*b;
    s = svd(A);
    disp(s);

    cos_t = norm(y)/norm(b);
    tan_t = tan(acos(cos_t));
    k_A = s(1)/s(end);
    etha = norm(A)*norm(x)/norm(y); 

    c11 = 1/cos_t;
    c12 = k_A/(etha*cos_t);
    c21 = k_A/cos_t;
    c22 = k_A * (k_A^2*tan_t)/etha;

end
