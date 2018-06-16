clear
clc

rng('default')
N = 20;
h = .25;
x_max = 1;
y_max = 1;
binNum = zeros(N,1);


% 
x = x_max*rand(N,1);
y = y_max*rand(N,1);

% x = x_max*ones(N,1);
% y = y_max*zeros(N,1);

n_x = floor(x_max/h);
n_y = n_x;
% creates a bin cell array which holds the points that belong to each
% particular bin
L = n_x*n_y;
bins = cell(L,1);
dx = x_max/n_x;
dy = dx;

for k = 1:N
    binNum(k) = (ceil(x(k)/dx) - 1)*n_y + ceil((y_max - y(k))/dy);
    j = binNum(k);
    % store the point in the appropriate bin
    bins{j,1} = [bins{j,1} ;x(k) y(k) k];
     
    
end

% calculate average point location in each bin
% c is a counter that controls the size of binAvg
c = 0;
for i = 1:L
    if isempty(bins{i,1})
       
    else
    c = c +1;   
    binAvgX(c) = sum(bins{i,1}(:,1))/length(bins{i,1}(:,1));
    binAvgY(c)= sum(bins{i,1}(:,2))/length(bins{i,1}(:,2));
    
    end
    
end
scatter(x,y,'b.')
hold on
scatter(binAvgX,binAvgY,'rx')
grid on
set(gca, 'XTick', 0:dx:x_max)
set(gca, 'YTick', 0:dy:y_max)

title('points and average bin location scatter plot')

for i = 1:L
    fprintf(['Bin ' num2str(i) ':  '])
    if isempty(bins{i,1})
        fprintf('%s ','[]')
    else
        fprintf('%i ',bins{i,1}(:,3))
    end
    fprintf('\n')

end