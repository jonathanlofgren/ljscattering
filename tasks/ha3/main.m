clear all
close all

f = @(x) (1 - x.^2).^(1/2);

iter = 100;
trap = zeros(1,iter);
simp = zeros(1,iter);
n2 = zeros(1,iter);
n4 = zeros(1,iter);
n8 = zeros(1,iter);

for i=1:iter
    trap(i) = abs(pi/2 - trap_quad(f, -1, 1, i));
    simp(i) = abs(pi/2 - simp_quad(f, -1, 1, i));
    n2(i) = abs(pi/2 - gauss_quad(f, -1, 1, i, 2));
    n4(i) = abs(pi/2 - gauss_quad(f, -1, 1, i, 4));
    n8(i) = abs(pi/2 - gauss_quad(f, -1, 1, i, 8));
end



f1 = figure(1);
semilogy(1:iter,trap, 'DisplayName', 'Trapezoid')
hold on
semilogy(1:iter,simp, 'DisplayName', 'Simpson')
semilogy(1:iter,n2, 'DisplayName', 'GL - n2')
semilogy(1:iter,n4, 'DisplayName', 'GL - n4')
semilogy(1:iter,n8, 'DisplayName', 'GL - n2')
hold off

lh = legend('-DynamicLegend');
set(lh, 'FontSize', 16)
set(gca, 'FontSize', 16)
xlabel('Evaluation points', 'FontSize', 20);
ylabel('Error', 'FontSize', 20);

