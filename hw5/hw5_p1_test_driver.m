% test driver for hw
clear
w = [-1 1 2];
x = [0.5 0 0.5 1];
y = [0 0.5 1 0.5];
x0 = x;
y0 = y;
d = 1;

iterations = 1;
while d > 1e-3
    xs = splitPts(x);
    xa = averagePts(xs,w);
    ys = splitPts(y);
    ya = averagePts(ys,w);
    
    dx = max(xa - xs);
    dy = max(ya - ys);
    
    d = sqrt(dx^2 + dy^2);
    
    x = xa;
    y = ya;
    iterations = iterations + 1;
    
    if iterations > 22
        error('non convergance')
    end
end
plot(x0,y0,'b*')
hold on
plot(x,y,'k.')
legend('original points', 'after iteration')

grid on
hold off