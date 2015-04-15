close all
clear all

%% parameters

E_range = [1.1 3]; 

E_vals = logspace(log10(E_range(1)), log10(E_range(2)), 5);

% potential parameters
V = 1;
r_max = 3;

b_points = 100;
bvals = linspace(0, r_max, b_points);
bvals = bvals(2:end-1);


%% analytical solution

figure(1)
for E=E_vals
    theta = zeros(1, b_points-2);
    
    for i=1:length(bvals)
       theta(i) = square_analytical(E, V, bvals(i), r_max); 
    end
   
    plot(bvals, theta)
    hold on
end

legend(num2str(E_vals(1)), num2str(E_vals(2)),num2str(E_vals(3)),num2str(E_vals(4)),num2str(E_vals(5)))
title('Square potential: analytical solution')
xlabel('Impact parameter b')
ylabel('Scattering angle (radians)')


%% numerical solution

figure(2)
for E=E_vals
    theta2 = zeros(1, b_points-2);
    
    for i=1:length(bvals)
       theta2(i) = scatter_square(E, bvals(i), V, r_max); 
    end
    
    plot(bvals, theta2)
    hold on
end

title('Square potential: numerical solution')
legend(num2str(E_vals(1)), num2str(E_vals(2)),num2str(E_vals(3)),num2str(E_vals(4)),num2str(E_vals(5)))
xlabel('Impact parameter b')
ylabel('Scattering angle (radians)')

figure(3)
Ee = 2;
theta_normal = zeros(1, b_points-2);
theta_half_anal = zeros(1, b_points-2);
for i=1:length(bvals)
    theta_normal(i) = scatter_square(E, bvals(i), V, r_max); 
    theta_half_anal(i) = scatter_square(E, bvals(i), V, r_max, 0);
end

plot(bvals, theta_normal, bvals, theta_half_anal);
legend('Both terms numerically','First term analytically')
xlabel('Impact parameter b')
ylabel('Scattering angle (radians)')

figure(4)
diff = abs(theta_normal-theta_half_anal);
plot(bvals, diff)
xlabel('Impact parameter b')
ylabel('Absolute value of error')