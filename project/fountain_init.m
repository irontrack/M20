% this is for writing the .mat file containing the initial conditions
% of the personal fluid problem.
% These initial conditions are meant to model a fountain spouts from the 
% bottom center of the container

% POSTION
x = zeros(100,1);
y = zeros(100,1);

% VELOCITY
u = zeros(100,1);
v = 10*ones(100,1);

% FORCES
fx = zeros(100,1);
fy = ones(100,1);

dx = 1/(400);
dy = 1/(400);

for i = 1:10
for j = 1:10
if i == 1 && j == 1
x(i) = .46 + dx;
y(i) = dy;
elseif i ~=1 && j == 1
x(10*(i - 1) + j) = .46 + dx;
y(10*(i - 1) + j) = y(10*(i - 1) + j - 1) + dy;
else
x(10*(i - 1) + j) = x(10*(i - 1) + j -1) + dx;
y(10*(i - 1) + j) = y(10*(i - 1) + j - 1);
end
end
end

scatter(x,y)
axis([0,1,0,1])
save('fountain_initial_conditions.mat','x', 'y','u','v','fx','fy')

