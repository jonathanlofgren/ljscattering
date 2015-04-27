function val = trapezoid(f, a, b)

    val = (b-a)/2 * sum(f(a) + f(b));
end