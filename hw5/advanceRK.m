% advance runge jutta function

function [y] = advanceRK(y, dt, method)

    function R1 = runge_kutta1(y,dt)
        
        c1 = dt*-(log(2)/2.45)*y;
        
        R1 = y + c1;
        
    end

    function R2 = runge_kutta2(y,dt)
        
        c1 = dt*-(log(2)/2.45)*y;
        c2 = dt*(-(log(2)/2.45)*(y + c1/2));
        
        R2 = y + c2;
    end

    function R4 = runge_kutta4(y,dt)
        
        c1 = dt*-(log(2)/2.45)*y;
        c2 = dt*(-(log(2)/2.45)*(y + c1/2));
        c3 = dt*(-(log(2)/2.45)*(y + c2/2));
        c4 = dt*(-(log(2)/2.45)*(y + c3));
        
        R4 = y + (1/6)*c1 + (1/3)*c2 + (1/3)*c3 +(1/6)*c4;
    end
        
    switch method
        case 'RK1'
            
           y = runge_kutta1(y,dt);
        case 'RK2'
            y = runge_kutta2(y,dt);
        case 'RK4'
            y = runge_kutta4(y,dt);
    end
end