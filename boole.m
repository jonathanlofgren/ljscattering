function integ = boole(fun, a, b, n)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


x = linspace(a, b, 4*n+1);
integ = 0;

for k=1:4:length(x)-1
    integ = integ + 7*fun(x(k)) + 32*fun(x(k+1)) + 12*fun(x(k+2))  ... 
              + 32*fun(x(k+3)) + 7*fun(x(k+4));
end
h = (x(2)-x(1));
integ = integ*2*h/45;

