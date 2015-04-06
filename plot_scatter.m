close all
clear all

%<<<<<<< HEAD
E_range = [2 4]; 
%=======
E_range = [0.1 2]; 
%>>>>>>> 0c67f89afd04bff2c077f11e18888ae4b7921e13

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
    [b_temp grad] = num_grad(bvals, theta);
    offset = (length(bvals)-length(grad)) / 2;
    cross_section = b_temp ./ ...
                    sin(theta(1+offset:end-offset)) .* ...
                    abs(grad);
                
    figure(1)
    subplot(2,1,1)
    plot(bvals, theta)
    hold on
    subplot(2,1,2)
    plot(b_temp, cross_section)
    hold on
    
    
end
subplot(2,1,1)
legend(num2str(E_vals(1)), num2str(E_vals(2)),num2str(E_vals(3)),num2str(E_vals(4)),num2str(E_vals(5)))
xlabel('Impact parameter b')
ylabel('Scattering angle (radians)')

