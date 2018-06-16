% DRIVER CODE FOR THE HOMEWORK 8, PROBLEM 2

x0 = 1.43:0.01:1.71;
L = length(x0);
evals = zeros(1,L);
xc = zeros(1,L);
delta = 1e-3;
fEvalMax = 15;
for i = 1:L
    
    [xc(i), evals(i)] = Newton(@f, x0(i), delta, fEvalMax);
    
    fprintf('x0 = %4.2f, ',x0(i))
    fprintf('evals = %2i, ',evals(i))
    fprintf('xc = %8.6f\n ',xc(i))
end
plot(x0,f(x0))
grid on 
