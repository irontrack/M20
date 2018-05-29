% EULER BEAM BENDING PROBLEM

function hw7_204669893_p2()
    
    L = 1;
    n = 20;
    X = linspace(0,1,n);
    P = -2000;
    R = 0.013;
    r = 0.011;
    E = 70e9;
    I = (pi/4)*(R^4 - r^4);
    d = 0.9;
    delta_X = X(2);
    M = zeros(n,1);
    
    for i = 1:n
        if X(i) < d
            M(i) = -P*(L - d)*X(i)/L;
        else
            M(i) = -P*d*(L - X(i))/L;
        end
    end
    plot(X,M)
    grid on
    xlabel('position')
    ylabel('moment')
    A = zeros(n,n);
    for i = 1:n
        if i == 1|| i == n
            A(i,i) = 1;
        else
            A(i,i - 1) = 1;
            A(i,i) = -2;
            A(i,i + 1) = 1;
        end
    end
    k = (delta_X^2)/(E*I);
    B = k*M;
    
    Y = A\B;
    figure (2)
    plot(X,Y)
    xlabel('x position')
    ylabel('y deflection')
    grid on
end