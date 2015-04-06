clear all
close all

Evals = linspace(0.1,3,100);
b = 1;
sigma = 1;

x = linspace(0.1, 3, 100);

for E=Evals
    
    [E_res, r_res, b_res] = orbit(E, b, sigma);
    if(r_res < 0)
        %break;
    end
end

f1 = figure(1);
f2 = figure(2);

%saveas(f1, 'figs/orbit', 'epsc');
%saveas(f2, 'figs/Vdiff', 'epsc');

