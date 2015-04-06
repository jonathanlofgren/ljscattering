function [bc] = find_bc(E, r, brange, sigma)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

f = @(E,a,b) E .* b.^2 ./ a.^2 + 4 .* sigma.^12 ./ a.^12 - 4 .* sigma.^6 ./ a.^6;

b = linspace(brange(1), brange(2), 100000);

diff = 1e6;
idx = 1;
for i=1:length(b)
    Etemp = f(E,r,b(i));
    if (abs(E - Etemp) < diff)
        idx = i;
        diff = abs(E - Etemp);
    end
end

if(diff < 0.01)
    bc = b(idx);
else
    bc = -1;
end

end

