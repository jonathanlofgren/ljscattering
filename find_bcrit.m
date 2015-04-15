function [b_crit err] = find_bcrit(E, PLOT)

if nargin < 2
    PLOT = 0;
end

b_points = 1000;
b = linspace(0.1, 3, b_points);
E_vals = zeros(size(b));

for k=1:length(b)

    du = [E*b(k)^2 0 0 0 -12 0 0 0 0 0 24];
    r = roots(du);
    real_roots = r(r == real(r));
    
    if (length(real_roots) < 2)
        break;
    end
    
    parmax = max(real_roots);
    val_max = U_eff(parmax, E, b(k));
    E_vals(k) = val_max;   
end

E_error = abs(E_vals - E);
[y, i] = min(E_error);
b_crit = b(i);
err = y;

if PLOT
    plot(b, E_vals, '*')
end

end
