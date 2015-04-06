%E = 0.5;
%b = 2;
%E = 0.56234;
%b = 1.8799;
E = 100;
b = 0.1;

du = [E*b^2 0 0 0 -12 0 0 0 0 0 24];
r = roots(du);
real_roots = r(r == real(r))
parmax = max(real_roots)
val_max = U_eff(parmax, E, b)