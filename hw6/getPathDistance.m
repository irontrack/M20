% FUNCTION GET PATH DISTANCE

function dist = getPathDistance(x, y, path)

    L = length(path);
    
    temp = 0;
    
    for i =1:L
        
        if i == L
            dx = x(path(1)) - x(path(L));
            dy = y(path(1)) - y(path(L));
        else
            dx = x(path(i + 1)) - x(path(i));
            dy = y(path(i + 1)) - y(path(i));
        end
        
        temp = temp + sqrt(dx^2 + dy^2);
        
    end
    
    dist = temp;
    
end