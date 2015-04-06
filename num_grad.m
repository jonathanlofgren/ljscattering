function [b grad] = num_grad(b, theta)
    
    offset = 1;
    grad = zeros(1, length(theta));
    for i=1+2*offset:length(theta)-2*offset
        grad(i) = 1*theta(i-2*offset) -8*theta(i-1*offset) ...
                 +8*theta(i+1*offset) -1*theta(i+2*offset);
    end
    
    grad = grad./(12*(b(2)-b(1))*offset);
    grad = grad(1+offset*2:end-offset*2);
    
    b = b(1+offset*2:end-offset*2);
end

