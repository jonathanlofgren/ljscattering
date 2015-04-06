function [E_res, r_res, b_res] = orbit(E, b, sigma)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
bmin = 0.1;
bmax = 3;
brange = [bmin bmax];
PLOT = 0;

f = @(a) E .* b.^2 ./ a.^2 + 4 .* sigma.^12 ./ a.^12 - 4 .* sigma.^6 ./ a.^6;

p = [E.*b.^2 0 0 0 -12*sigma.^6 0 0 0 0 0 24*sigma.^12];
r = roots(p);
r_res = [];
for i=1:length(r)
    if isreal(r(i,:)) && r(i,1) > 0
        r_res = [r_res r(i,1)];
    end
end

if (length(r_res) == 2  && max(r_res) <= 3)
    r_res = max(r_res);
    PLOT = 1;
else
    r_res = -1;
    E_res = -1;
    b_res = -1;
end

if (PLOT == 1)
    E_res = f(r_res);
    b_res = find_bc(E, r_res, brange, sigma);
    %b_res = r_res * sqrt(E - (4 .* sigma.^12 ./ r_res.^12 - 4 .* sigma.^6 ./ r_res.^6)/E);

    f1 = figure(1);
    a = linspace(0.95,3,100);
    plot(a, f(a), 'LineWidth', 1, ...
         'DisplayName', [num2str(E)])
    title('', 'FontSize', 16)
    xlabel('r', 'FontSize', 20)
    ylabel('Energy', 'FontSize', 20)
    lh1 = legend('-DynamicLegend');
    set(gca, 'FontSize', 16)
    set(lh1, 'FontSize', 16, 'Location', 'best')
    hold on

    f2 = figure(2);
    x = linspace(0, 3, 100);
    plot(x, polyval(p,x), 'LineWidth', 1, ...
         'DisplayName', [num2str(E)])
    title('', 'FontSize', 16)
    xlabel('r', 'FontSize', 20)
    ylabel('Derivative of total Energy', 'FontSize', 20)
    lh2 = legend('-DynamicLegend');
    set(gca, 'FontSize', 16)
    set(lh2, 'FontSize', 16, 'Location', 'best')
    ylim([-200 250]);
    hold on
end

end

