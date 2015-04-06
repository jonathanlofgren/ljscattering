function u = U_eff(r, E, b)
u = E.*(b./r).^2 + 4*(1./(r.^12) - 1./(r.^6));
end

