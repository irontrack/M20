a = input('please input a: ');
b = input('please input b: ');

h = ((a - b)/(a +b))^2;
P1 = pi*(a + b)
P2 = pi*sqrt(2*(a^2 + b^2))
P3 = pi*sqrt(2*(a^2 + b^2) - ((a - b)^2)/2)
P4 = P1*(1 + (h/8))^2
P5 = P1*(1 + (3*h/(10 + sqrt(4 - 3*h))))
P6 = P1*((64 - 3*h^2)/(64 - 16*h))
P7 = P1*((256 - 48*h - 21*h^2)/(256 - 112*h + 3*h^2))
P8 = P1*((3 - sqrt(1 - h))/2)

h