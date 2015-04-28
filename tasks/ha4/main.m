% Main file using get_phi, boole, and boole_quad for home assignment 4
clear all
close all

% Number of points and iterations. Higher number of points require 
% more iterations to match the exact solution
N = 200;
iter = 50000;

% S(x)
f = @(x) 12.*x.^2;

x = linspace(0,1,N);
h = x(2)-x(1);
phi = zeros(1,N);
new_phi = zeros(1,N);

% Loop for iterations
for j=1:iter
    
    % Loop for the phi array
    for i=2:N-1
        new_phi(i) = get_phi(x,phi,i,h,f);
    end
    phi = new_phi;
    
    % Plotting the iterative solution
    if ( mod(j,100) == 0 )
        plot(x, phi)
        hold on
    end
end

% Exact solution plotted
exact = @(x) x.*(1-x.^3);
plot(x, exact(x), 'LineWidth', 4, 'Color', [0 0 0.75])

hold off

% Energy and relative error calculated
h = x(2)-x(1);
E = 1/(2*h) * sum(( phi(2:N) - phi(1:N-1) ).^2) - boole_quad(0,1,phi.*f(x));
E_exact = -9/14
Error = (E_exact - E) / E_exact;


