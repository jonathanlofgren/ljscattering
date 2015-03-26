close all
clear all

E_range = [2 4]; 

E_vals = logspace(log10(E_range(1)), log10(E_range(2)), 5);

% potential parameters
sigma = 1;
eps = 1;

b_points = 100;
bvals = linspace(0, sigma*3, b_points);
bvals = bvals(2:end-1);

for E=E_vals
    theta = zeros(1, b_points-2);
    
    for i=1:length(bvals)
       theta(i) = scatter(E, bvals(i), sigma, eps); 
    end
   
    plot(bvals, theta)
    hold on
end

legend(num2str(E_vals(1)), num2str(E_vals(2)),num2str(E_vals(3)),num2str(E_vals(4)),num2str(E_vals(5)))
xlabel('Impact parameter b')
ylabel('Scattering angle (radians)')