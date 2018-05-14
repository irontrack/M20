% HOMEWORK PROBLEM 1 
% FOR EULER AND THREE SPECIES POPULATION

% USING FOR EULER TO SOLVE FOR DIFFERENTIAL EQUATIONS 
% AS A FUNCTION OF TIME, THE POPULATION AT T = 12 SECONDS.


% intital values are initialized
X_0 = 2;
Y_0 = 2.49;
Z_0 = 1.5;
dt = 0.01;
t_final = 12;
n = t_final/dt + 1;

% memory for the results are pre- allocated
X = ones(n,1);
Y = ones(n,1);
Z = ones(n,1);

X(1) = X_0;
Y(1) = Y_0;
Z(1) = Z_0;
k = 1;

    
% iterative calculation of the species growth 
while k < n
    
    X(k + 1) = X(k) + (0.75*X(k)*(1 - X(k)/20) - 1.5*X(k)*Y(k) - 0.5*X(k)*Z(k))*dt;
    Y(k + 1) = Y(k) + (Y(k)*(1 - Y(k)/25) - 0.75*X(k)*Y(k) - 1.25*Y(k)*Z(k))*dt;
    Z(k + 1) = Z(k) + (1.5*Z(k)*(1 - Z(k)/30) - X(k)*Z(k) - Y(k)*Z(k))*dt;
    
    k = k + 1;
end

% print out the header for results
fprintf('%s','Time')
fprintf('  %s','   X')
fprintf('  %s','   Y')
fprintf('  %s\n','   Z')

% print out values of the growth at 0.5 second intervals
for i = 0:0.5:12
    fprintf(' %3.1f',i)
    fprintf('%6.2f',X(i/dt + 1))
    fprintf('%6.2f',Y(i/dt + 1))
    fprintf('%6.2f\n',Z(i/dt + 1))
end
    


    