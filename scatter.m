clear all

E = 1;
b = 0.5;
sigma = 1;
eps = 1;

r_min = b;
r_max = 3*sigma;

term1 = @(r) 1./r.^2 .* (1-(b./r).^2).^(-1/2);
term2 = @(r) 1./r.^2 .* (1-(b./r).^2 - lennard_jones(r,sigma,eps)/E).^(-1/2);

%test = linspace(1,3,10)
%ans1 = term1(test)
%ans2 = term2(test)

%term2 = @(r) 1/r.^2 .* (1-b^2/r.^2 - square(r,sigma,eps)/E)^(-1/2);
n = 10;
a1 = boole(term1, b, r_max, n);
a2 = boole(term2, r_min, r_max, n);
a = a1-a2