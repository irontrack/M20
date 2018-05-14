function T = search_group(group)

    L = length(group);
    if L == 1
        T = false;
    else
       temp = group(L);
       for i = 1:(L-1)
           if abs(group(i) - temp)<7 
               T = true;
           elseif (group(i) < 7 && 365 - temp < 7)||(365 - group(i)<7 && temp < 7)
                if abs(group(i) + temp - 365) < 7
                    T = true;
                end
           else
               T = false;
           end
       end
    end
    
    
    
end
