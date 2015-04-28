function phi = get_phi(xvec, phivec, i, h, fun_S)
% calculates phi with the iterative method

    x = xvec(i);
    phi = 1/2 * ( phivec(i-1) + phivec(i+1) + h^2 * fun_S(x) );

end