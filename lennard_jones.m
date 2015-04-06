function V = lennard_jones(r, sigma, eps)

V = 4*eps*((sigma./r).^12 - (sigma./r).^6);

end

