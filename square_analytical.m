function theta = square_analytical(E, V, b, r_max)

    r_min = b/sqrt(1-V/E);
    
    %term1 = 1/b * asec(r_max/b);
    term1f = @(r) 1/b * asec(r/b);
    term2f = @(r) 1/b * asec(r*sqrt(1-V/E)/b);
    
    term1 = term1f(r_max);% - term1f(b);
    term2 = term2f(r_max);% - term2f(r_min);
    
    theta = 2*b*(term1-term2);

end

