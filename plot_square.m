close all
clear all

%% parameters

E_range = [0.1 10];

E_vals = logspace(log10(E_range(1)), log10(E_range(2)), 5);



% potential parameters
V = -1;
r_max = 3;

b_points = 100;
bvals = linspace(0, r_max, b_points);
bvals = bvals(2:end-1);

% plot parameters
ymin = 0;
ymax = 0;


%% analytical solution

f1 = figure(1);
for E=E_vals
    theta = zeros(1, b_points-2);
    
    for i=1:length(bvals)
       theta(i) = square_analytical(E, V, bvals(i), r_max); 
    end
    ymin = min([ymin min(real(theta))]);
    ymax = max([ymax max(real(theta))]);
    
    plot(bvals, theta, ...
         'LineWidth', 1)
    hold on
end

lh1 = legend(num2str(E_vals(1)), num2str(E_vals(2)), ...
      num2str(E_vals(3)),num2str(E_vals(4)),num2str(E_vals(5)));
  
title('Square potential: analytical solution', 'FontSize', 20)
xlabel('Impact parameter b', 'FontSize', 20)
ylabel('Scattering angle (radians)', 'FontSize', 20)


%% numerical solution

f2 = figure(2);
for E=E_vals
    theta2 = zeros(1, b_points-2);
    
    for i=1:length(bvals)
       theta2(i) = scatter_square(E, bvals(i), V, r_max); 
    end
    
    if (max(theta2) > 3/2*pi)
        theta2 = theta2 -2*pi;
    end
    
    ymin = min([ymin min(real(theta))]);
    ymax = max([ymax max(real(theta))]);
    
    plot(bvals, theta2, ...
         'LineWidth', 1)
    hold on
end

title('Square potential: numerical solution', 'FontSize', 20)
lh2 = legend(num2str(E_vals(1)), num2str(E_vals(2)), ...
      num2str(E_vals(3)),num2str(E_vals(4)),num2str(E_vals(5)));
  
xlabel('Impact parameter b', 'FontSize', 20)
ylabel('Scattering angle (radians)', 'FontSize', 20)

ymin = round(ymin * 10) / 10 - 0.1;
ymax = round(ymax * 10) / 10 + 0.1;

figure(1)
%ylim([ymin ymax])
set(lh1, 'FontSize', 16, 'Location', 'best')
set(gca, 'FontSize', 16)
figure(2)
%ylim([ymin ymax])
set(lh2, 'FontSize', 16, 'Location', 'best')
set(gca, 'FontSize', 16)

name1 = ['figs/sq_a_Evals_' num2str(E_vals(1)) '_to_' num2str(E_vals(end)) '_V_' num2str(V)];
name2 = ['figs/sq_n_Evals_' num2str(E_vals(1)) '_to_' num2str(E_vals(end)) '_V_' num2str(V)];

name1 = strrep(name1, '.', ',');
name2 = strrep(name2, '.', ',');

saveas(f1, [name1 '.eps'], 'epsc');
saveas(f2, [name2 '.eps'], 'epsc');
