dx = .5/11;
dy = 1/11;
x = zeros(100,1);
y = zeros(100,1);
for i = 1:10
for j = 1:10
if i == 1 && j == 1
x(i) = dx;
y(i) = dy;
elseif i ~=1 && j == 1
x(10*(i - 1) + j) = dx;
y(10*(i - 1) + j) = y(10*(i - 1) + j - 1) + dy;
else
x(10*(i - 1) + j) = x(10*(i - 1) + j -1) + dx;
y(10*(i - 1) + j) = y(10*(i - 1) + j - 1);
end
end
end
u = zeros(100,1);
v = zeros(100,1);
fx = zeros(100,1);
fy = zeros(100,1);
scatter(x,y)
axis([0,1,0,1])
save('damn_break_initial_conditions.mat','x', 'y','u','v','fx','fy')