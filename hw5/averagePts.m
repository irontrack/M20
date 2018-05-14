% THIS IS THE AVERAGING FUNCITON

function [xa] = averagePts(xs, w)

    % validate the wieght vector
    if (w(1) + w(2) +w(3) == 0)||length(w) ~= 3
        error('invalid weight vecotr')
    end
    
    L = length(xs);
    temp = zeros(1,L);
    wt = w(1) + w(2) + w(3);
    w1 = w(1)/wt;
    w2 = w(2)/wt;
    w3 = w(3)/wt;
    
    for i = 1:L
        
        if i == 1
            temp(i) = w1*xs(L) + w2*xs(i) + w3*xs(i + 1);
        elseif i == L
            temp(i) = w1*xs(i - 1) + w2*xs(i) + w3*xs(1);
        else
            temp(i) = w1*xs(i - 1) + w2*xs(i) + w3*xs(i + 1);
        end
    end
    
    
    
    
   
    
    %return xa
    xa = temp;
    
end
    