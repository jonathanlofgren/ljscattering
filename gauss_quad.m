function val = gauss_quad(fun, a, b, n)

x = linspace(a, b, n+1);
val = 0;

for i=1:length(x)-1
    val = val + guassian4(fun, x(i), x(i+1));
end

