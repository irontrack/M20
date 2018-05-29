% NEWTONS METHOD EVALUATION FUNTION.

function [xc, fEvals] = Newton(f, x0, delta, fEvalMax)
    temp_evals = 0;
    xt = x0;
    finished = false;
    
    function fp = f_prime(f, x)
        
        fp = (f(x + 1e-6) - f(x - 1e-6))/(2e-6);
    end
    while ~finished
        xt = xt - (f(xt)/f_prime(f,xt));
        
        temp_evals = temp_evals + 1;
        
        if abs(f(xt)) <= delta
           
            finished = true;
        elseif temp_evals >= fEvalMax
            finished = true;
        end

    end
    xc = xt;
    fEvals = temp_evals;

end