clear all

E = 1000;
b = 0.5;

% parameters for the potential
sigma = 1;
eps = 1;

r_max = 3*sigma;

term1 = @(r) 1./r.^2 .* (1-(b./r).^2).^(-1/2);
term2 = @(r) 1./r.^2 .* (1-(b./r).^2 - lennard_jones(r,sigma,eps)/E).^(-1/2);

% find the outermost zero of the square root argument
sqroot = @(r) 1-(b^2/r^2) - lennard_jones(r,sigma,eps)/E;
outmost_zero = fzero(sqroot, 1);
r_min = outmost_zero;

x = linspace(0.9,10);
y = zeros(length(x),1);
for i=1:length(y)
   y(i) = sqroot(x(i)); 
end
plot(x,y)

n = 10;
a1 = integral(term1, b, r_max);
a2 = integral(term2, r_min, r_max);
a = a1-a2