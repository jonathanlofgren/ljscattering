function theta = scatter_square(E, b, V, r_max, term1_num)

    if (nargin < 5)
        term1_num = 1;
    end


    term1 = @(r) 1./r.^2 .* (1-(b./r).^2).^(-1/2);
    term2 = @(r) 1./r.^2 .* (1-(b./r).^2 - V/E).^(-1/2);
    
    % find the outermost zero of the square root argument
    %sqroot = @(r) 1-(b^2/r^2) - V/E;
    %outmost_zero = fzero(sqroot, 1);
    r_min = b/sqrt(1-V/E);
    %disp(['Found r_min = ' num2str(r_min)])
  
    term1f = @(r) 1/b * asec(r/b);
    
    n = 100;
    
    if (term1_num)
        b1 = gauss_quad(term1, b, r_max, n);
    else
        b1 = term1f(r_max);
    end
    
    b2 = gauss_quad(term2, r_min, r_max, n);
    
    
    theta = 2*b*(b1-b2);  
end