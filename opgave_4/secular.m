function val = secular(l, beta, z, d1, d2)
    val = 1 + beta * z^2 * ((d1 - l) + (d2 - l));
end
