r = linspace(0.9, 2);

E = 0.5;
B = 1.9201


for b=B
    u_eff = U_eff(r, E, b);
    plot(r,u_eff)
    hold on
end

plot(r, E*ones(size(r)))