function a = adjacentBins(z,nx,ny)

    N = nx*ny;
    
    temp = [];
    
    for i = 1:8
        switch i
            case 1
                if z - ny - 1 > 0 && mod(z,nx) - 1 ~= 0 
                    temp = [temp (z - ny -1)];
                end
            case 2
                if z - ny > 0
                    temp = [temp (z - ny)];
                end
            case 3 
                if mod(z,nx) ~= 0 && (z - ny + 1) > 0
                    temp = [temp (z - ny + 1)];
                end
            case 4
                if z - 1 > 0 && mod(z,nx) - 1 ~= 0 
                    temp = [temp (z - 1)];
                end
            case 5
                if mod(z,nx) ~= 0
                    temp = [temp (z + 1)];
                end
            case 6
                if z + ny - 1 <= N && mod(z,nx) - 1 ~= 0 
                    temp = [temp (z + ny -1)];
                end
            case 7
                if z + ny <= N
                    temp = [temp (z + ny)];
                end
            case 8 
                if mod(z,nx) ~= 0 && (z + ny + 1)<= N
                    temp = [temp (z + ny + 1)];
                end
            
                
            
        end
    end
    
    a = temp;
    
end