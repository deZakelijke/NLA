% Made by Micha de Groot

function [A, b] = generate_data()
    m = 99;
    n = 14;
    t = [0:m]'/m;
    A = [];

    for j=0:n
        A = [A t.^j];
    end

    b = exp(sin(4*t));
    z = 2006.787453080206;
    b = b/z;

end
