E = 0.5;
b = 2;

du = [E*b^2 0 0 0 -12 0 0 0 0 0 24];
r = roots(du);
real_roots = r(r == real(r))
parmax = max(real_roots)
val_max = U_eff(parmax, E, b)