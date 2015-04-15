%clear all
%close all

Evals = linspace(0.1,1,10);
%Evals = 0.5;
b = 1;
sigma = 1;

x = linspace(0.1, 3, 100);

ev = [];
bv = [];

for E=Evals
    
    [E_res, r_res, b_res] = orbit(E, b, sigma);
    
    ev = [ev E_res];
    bv = [bv b_res];
    
    if(r_res < 0)
        break;
    end
end

%f1 = figure(1);
%f2 = figure(2);

%saveas(f1, 'figs/orbit', 'epsc');
%saveas(f2, 'figs/Vdiff', 'epsc');

Evals = Evals(bv>=0);
bv = bv(bv>=0);

f3 = figure(3);
plot(Evals, bv, 'LineWidth', 1, 'Marker', '*')
xlabel('Energy', 'FontSize', 20)
ylabel('critical b', 'FontSize', 20)
set(gca, 'FontSize', 16)

%saveas(f3, 'figs/ebcrit.png','png')


