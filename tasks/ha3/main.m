% Main using a set of functions to calculate home assignment 3
% The result is that GL8 > GL4 > GL2 >= Simpson > Trapezoid. 

% For a regular FUNCTION == 1  we see different slopes in the loglog
% plot which is expected. For this particular FUNCTION == 0 all lines have
% the same slope but starting at different amplitude. I suppose this 
% means that the funciton is really hard to integrate accurately around
% -1 and 1. The derivative of the function will be infinite and all 
% integration functions we use use some kind of polynomial approximation
% so this might be the reason for inaccuracy.

clear all
close all

% function to integrate
FUNCTION = 0;
if FUNCTION == 0
    f = @(x) (1 - x.^2).^(1/2);
    exact = pi/2;
    int = [-1 1];
elseif FUNCTION == 1
    f = @(x) sin(x);
    exact = 2;
    int = [0 pi];
end

iter = 100;
trap = zeros(1,iter);
simp = zeros(1,iter);
n2 = zeros(1,iter);
n4 = zeros(1,iter);
n8 = zeros(1,iter);

% Main loop calculating the integral with different number of points using
% Trapezioid method, Simpson method and Gauss Legendre with 2, 4 and 8 
% number of weights and points
for i=2:iter
    trap(i) = abs(exact - trap_quad(f, int(1), int(2), i));
    simp(i) = abs(exact - simp_quad(f, int(1), int(2), i));
    n2(i) = abs(exact - gauss_quad(f, int(1), int(2), i, 2));
    n4(i) = abs(exact - gauss_quad(f, int(1), int(2), i, 4));
    n8(i) = abs(exact - gauss_quad(f, int(1), int(2), i, 8));
end


% Plotting
f1 = figure(1);
loglog(1:iter,trap, 'DisplayName', 'Trapezoid')
hold on
loglog(1:1:iter,simp, 'DisplayName', 'Simpson')
loglog(1:1:iter,n2, 'DisplayName', 'GL - n2')
loglog(1:1:iter,n4, 'DisplayName', 'GL - n4')
loglog(1:1:iter,n8, 'DisplayName', 'GL - n8')
hold off

% % Plotting
% f1 = figure(1);
% semilogy(1:iter,trap, 'DisplayName', 'Trapezoid')
% hold on
% semilogy(1:2:iter*2,simp, 'DisplayName', 'Simpson')
% semilogy(2:2:iter*2,n2, 'DisplayName', 'GL - n2')
% semilogy(4:4:iter*4,n4, 'DisplayName', 'GL - n4')
% semilogy(8:8:iter*8,n8, 'DisplayName', 'GL - n2')
% hold off

lh = legend('-DynamicLegend');
set(lh, 'FontSize', 16)
set(gca, 'FontSize', 16)
xlabel('Evaluation points', 'FontSize', 20);
ylabel('Error', 'FontSize', 20);

