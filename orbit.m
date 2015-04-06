function [E_res, r_res, b_res] = orbit(E, b, sigma)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
bmin = 0.1;
bmax = 100;
brange = [bmin bmax];

f = @(a) E .* b.^2 ./ a.^2 + 4 .* sigma.^12 ./ a.^12 - 4 .* sigma.^6 ./ a.^6;

p = [E.*b.^2 0 0 0 -12*sigma.^6 0 0 0 0 0 24*sigma.^12];
r = roots(p);
r_res = [];
for i=1:length(r)
    if isreal(r(i,:)) && r(i,1) > 0
        r_res = [r_res r(i,1)];
    end
end

if (length(r_res) == 2)
    r_res = max(r_res);
else
    r_res = -1;
end

E_res = f(r_res);
b_res = find_bc(E, r_res, brange, sigma);
%b_res = r_res * sqrt(E - (4 .* sigma.^12 ./ r_res.^12 - 4 .* sigma.^6 ./ r_res.^6)/E);

figure(1)
subplot(1,2,1)
a = linspace(0.95,3,100);
plot(a, f(a))
hold on

subplot(1,2,2)
x = linspace(0.1, 1.7, 100);
plot(x, polyval(p,x))
hold on

end

