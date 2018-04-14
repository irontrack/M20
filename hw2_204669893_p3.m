% HW PROBLEM 3: CUBIC FUNCTIONS

% CUBIC FUNCTIONS COME IN THE FOLLOWING FORM
% aX^3 +bX^2 +c X + d

% PROMPT FOR  a,b,c, and d.

% check for monotone or simplicity
a = input('input a: ');
b = input('input b: ');
c = input('input c: ');
d = input('input d: ');

A = 3*a;
B = 2*b;
C = c;

p = [A B C];

r = roots(p);

monotone = false;

if ~isreal(r(1))||r(1) == r(2)
    monotone = true;
else
    monotone = false;
end
fprintf('a =%10.6f\n',a);
fprintf('b =%10.6f\n',b);
fprintf('c =%10.6f\n',c);
fprintf('d =%10.6f\n',d);

if ~monotone
    

    q1 = a*r(1)^3 + b*r(1)^2 + c*r(1) + d;
    q2 = a*r(2)^3 + b*r(2)^2 + c*r(2) + d;
    fprintf('r1 =%10.6f\n',r(1));
    fprintf('q(r1) =%10.6f\n',q1);
    fprintf('r2 =%10.6f\n',r(2));
    fprintf('q(r2) =%10.6f\n',q2);
    if q1*q2 < 0
        
        fprintf('%s\n','Function q is simple.')
    else
        fprintf('%s\n','Function q is NOT simple.')
    end
else
    fprintf('%s\n','Monotone')
    
end
