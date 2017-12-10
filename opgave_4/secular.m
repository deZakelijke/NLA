% Made by Micha de Groot

function val = secular(l, beta, z, d)
    val = 0;
    n = size(d);
    for i = 1:n
        val = val + (z(i)^2 / (d(i) - l));
    end
    val = 1 + val * beta;
end
