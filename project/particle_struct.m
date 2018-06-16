% structure we need
% variables: pos: x y ;velocity: v; force F; density: rho; neighbors [];

function p = particle_struct(N,xmax,ymax)
    
    % initialize particle startign locations
    temp = cell(N,1);
    % HERE YOU NEED TO LOAD THE X AND Y INITIAL CONDITIONS FROM A 
    % .MAT FILE WHICH CONTAINS THE X AND Y CONDITIONS.
    % NOTE: YOU MUST HAVE N SET TO MATCH THE SIZE OF X AND Y IN
    % THE DRIVER FILE. THIS WILL NOT HAPPEN AUTOMATICALLY
    load('damn_break_initial_conditions.mat')
  
    % CREATES STRUCT USING THE INITIAL POS CONDITIONS
    for i =1:N
        temp{i,1} = struct('pos', [x(i) y(i)],'vel',[u(i) v(i)],'force',[fx(i) fy(i)],'density',[],...
                    'neighbors',[]);
    end
    

            
            p = temp;

            
end
