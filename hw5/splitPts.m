% SPLIT POINTS FUNCITON. ACCEPTS A VECTOR AND SPLITS POINTS EVENLY.


function [xs] = splitPts(x)

    L = length(x);
    temp = zeros(1,2*L);
    for i = 1:L       
            index = 2*i - 1;
            temp(index) = x(i);

    end
    
    for i = 1:L
        k = 2*i;
        if k == 2*L
            temp(k) = (temp(k - 1) + temp(1))/2;
        else
            temp(k) = (temp(k - 1) + temp(k + 1))/2;
        end
    end
    
    xs = temp;
    
end


        
    
    
        