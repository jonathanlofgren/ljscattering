function val = boole_quad(a,b,phi)
% Calculates the integral value between a and b for a series of phi-values.
% length(phi) should be: mod(length(phi),4) = 0

val = 0;
x = linspace(a,b,length(phi));

for i=1:4:length(x)-4
    val = val + boole(i,x,phi);
end
    
end