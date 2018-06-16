function B = bins_struct(particles,dx,dy,nx,ny,ymax)

    numBins = nx*ny;
    
    temp = cell(numBins,1);
    
    for i = 1:numBins
        temp{i} = struct('particleIDs',[],'adjacentBins',[]);
        % assign adjacent bins; done with a function
        temp{i}.adjacentBins = adjacentBins(i,nx,ny);
         
        
    end
    length(particles);
    for k = 1:length(particles)
        % assign each particle a bin
        binNum = (ceil(particles{k}.pos(1)/dx) - 1)*ny + ceil((ymax - particles{k}.pos(2))/dy);
%         k
%         particles{k}.pos
        if binNum > numBins || binNum < 0
            fprintf('X and Y are: %5.3f',particles{k}.pos(1))
            fprintf(' and %5.3f\n',particles{k}.pos(2))
            k
        end
        temp{binNum}.particleIDs = [temp{binNum}.particleIDs k];
    end
    
    B = temp;
end