E_vals = linspace(0.01, 0.8);
b_crit = [];

for E=E_vals
    b_crit = [b_crit find_bcrit(E)];
end

plot(E_vals, b_crit)
xlabel('Energy (E)')
ylabel('Critical b for orbit')
