function val = boole(i,x,phi)
% Calculates the integral value between x(i) and x(i+4) with booles
% method

    h = x(2)-x(1);
    val = 2*h/45 * sum(7*phi(i) + 32*phi(i+1) + 12*phi(i+2) + ...
                       32*phi(i+3) + 7*phi(i+4));
end