function val = simpson(f, a, b)

    val = (b-a)/6 * sum(f(a) + 4*f(a+(b-a)/2) + f(b));
end