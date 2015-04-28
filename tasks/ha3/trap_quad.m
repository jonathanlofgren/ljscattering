function val = trap_quad(fun, a, b, n)
    
x = linspace(a, b, n);
val = 0;

for i=1:length(x)-1
    val = val + trapezoid(fun, x(i), x(i+1));
end
    
end