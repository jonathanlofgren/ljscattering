clear all
close all

Evals = linspace(0.1,3,10);
b = 1;
sigma = 1;

for E=Evals
    
    [E_res, r_res, b_res] = orbit(E, b, sigma);
    if(r_res < 0)
        break;
    end
end