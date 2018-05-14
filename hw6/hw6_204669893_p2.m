% DRIVER FOR THE SIMULATED ANNEALING

clc
clear all

rng('shuffle')
N = 30;


path = randperm(N);
x = rand(1,N);
y = rand(1,N);


distNew = 0;

T = 1000;
lambda = 0.005;
c = 1000;
p = 0;
k = 1;
while T > 1
    nodesNew = randperm(N,2);
    pathNew = path;
    % swap nodes to create new path
    temp = pathNew(nodesNew(1));
    pathNew(nodesNew(1)) = pathNew(nodesNew(2));
    pathNew(nodesNew(2)) = temp;
    % update distances
    dist = getPathDistance(x,y,path);
    distNew = getPathDistance(x,y,pathNew);
    
    % find delta L and update temperature.
    dL = distNew - dist;
   
    
    
    p = exp(-c*dL/T);
    
    if dL < 0
        path = pathNew;
    elseif p > rand
        path = pathNew;
    end
    
    T = T*(1 - lambda);   
    DIST(k) = dist;
    k = k + 1;
end

X = zeros(1,N + 1);
Y = zeros(1,N + 1);
for i = 1:N + 1
    if i > N
         X(i) = x(path(1));
         Y(i) = y(path(1));
    else
        X(i) = x(path(i));
        Y(i) = y(path(i));
    end
   
end

plot(X,Y)
figure (2)
k = 0:k - 2; 
plot(k,DIST)



