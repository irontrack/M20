% problem 3


% here the problem parameters are prompted

x1 = input('please input X1: ');
y1 = input('please input Y1: ');
r1 = input('please input R1: ');
x2 = input('please input X2: ');
y2 = input('please input Y2: ');
r2 = input('please input R2: ');

% compute delta X and Y.
dX = x2 - x1;
dY = y2 - y1;

% compute d: distance of each circle's center from the other
d = sqrt(dX^2 + dY^2);

% compute c: the chord length of the lense.
c = (1/d)*sqrt((-d + r1 +r2)*(d - r1 + r2)*(d + r1 - r2)*(d + r1 + r2));

% compute AREA of the the lense.
AREA = (r1^2)*acos((d^2 + r1^2 - r2^2)/(2*d*r1)) ...
        + (r2^2)*acos((d^2 - r1^2 + r2^2)/(2*d*r2))...
        - (d/2)*c;
    fprintf('\nx1 = %3.2f\n',x1)
    fprintf('y1 = %3.2f\n',y1)
    fprintf('r1 = %3.2f\n',r1)
    fprintf('x1 = %3.2f\n',x2)
    fprintf('y1 = %3.2f\n',y2)
    fprintf('r1 = %3.2f\n',r2)
    fprintf('Area = %5.4f\n',AREA)
   


    