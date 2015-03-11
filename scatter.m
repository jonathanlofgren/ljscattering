function theta = scatter(E, b, sigma, eps)

    % cutoff limit for the lj potential
    r_max = 3*sigma;

    term1 = @(r) 1./r.^2 .* (1-(b./r).^2).^(-1/2);
    term2 = @(r) 1./r.^2 .* (1-(b./r).^2 - lennard_jones(r,sigma,eps)/E).^(-1/2);

    % find the outermost zero of the square root argument
    sqroot = @(r) 1-(b^2/r^2) - lennard_jones(r,sigma,eps)/E;
    outmost_zero = fzero(sqroot, 1);
    r_min = outmost_zero;
    %disp(['Found r_min = ' num2str(r_min)])
    
    n = 100;
    b1 = gauss_quad(term1, b, r_max, n);
    b2 = gauss_quad(term2, r_min, r_max, n);
    
    theta = b1-b2;  
end