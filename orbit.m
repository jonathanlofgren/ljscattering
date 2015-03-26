function [res] = orbit(E, b, sigma)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

p = [E*b^2 0 0 0 -12*sigma.^6 0 0 0 0 0 24*sigma.^12];
r = roots(p)
res = [];
for i=1:length(r)
    if isreal(r(i,:)) && r(i,1) > 0
        res = [res r(i,1)];
    end
end

if (length(res) == 2)
    res = max(res);
else
    res = -1;
end


end

