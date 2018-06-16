% UPDATES AND RETURNS THE UPDATED PARTICLES CELL

% FIRST INTEGRATE FORCES AND VELOCITIES

% THEN CHECK POSITIONS

function new_par = update_particles(particles,dt,N,xmax,ymax)
    beta = 0.33;
    
    for k = 1:N
        
        % this calculates the dv as a vector
        dv = (1/particles{k}.density)*(particles{k}.force)*dt;
        particles{k}.vel = particles{k}.vel + dv;
        
        particles{k}.pos = particles{k}.pos + particles{k}.vel*dt;
        
        % check boundary cases x then y
        if particles{k}.pos(1) > xmax && particles{k}.pos(1) < 2*xmax
            particles{k}.pos(1) = 2*xmax - particles{k}.pos(1);
            particles{k}.vel(1) = -beta*particles{k}.vel(1);
        elseif particles{k}.pos(1) > 2*xmax 
            particles{k}.pos(1) = 0.99*xmax;
            particles{k}.vel(1) = -beta*particles{k}.vel(1);
        elseif particles{k}.pos(1) < 0 && particles{k}.pos(1) > -xmax
%             fprintf('particle %i ',k)
%             fprintf('is less than zero\n')
            particles{k}.pos(1) = -particles{k}.pos(1);
            particles{k}.vel(1) = -beta*particles{k}.vel(1);
        elseif particles{k}.pos(1) < -xmax
            particles{k}.pos(1) = 0.01*xmax;
            particles{k}.vel(1) = -beta*particles{k}.vel(1);
        end
        
        %   CONTROLS FOR Y POS
        if particles{k}.pos(2) > ymax && particles{k}.pos(2) < 2*ymax
            particles{k}.pos(2) = 2*ymax - particles{k}.pos(2);
            particles{k}.vel(2) = -beta*particles{k}.vel(2);
        elseif particles{k}.pos(2) > 2*ymax 
            particles{k}.pos(2) = 0.99*ymax;
            particles{k}.vel(2) = -beta*particles{k}.vel(2);
        elseif particles{k}.pos(2) < 0 && abs(particles{k}.pos(2)) < ymax
            particles{k}.pos(2) = -particles{k}.pos(2);
            particles{k}.vel(2) = -beta*particles{k}.vel(2);
        elseif particles{k}.pos(2) < -ymax
            particles{k}.pos(2) = 0.01*ymax;
            particles{k}.vel(2) = -beta*particles{k}.vel(2);    
        end
        
    end
    
    new_par = particles;
    
end

    