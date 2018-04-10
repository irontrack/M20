% hw 1 source code

% edge variables initialized
% @param T,C,O,D,I are 1 by 3 arrays that
% hold inradius, outradius, and Edge 
% for each platonic solid

% outradius of each solid is equal to the inradius
% of the solid which encapsulates it.

% R_U is the radius of the unit sphere
R_U = 1;

% tetrahedron properties initialized
E_T = (4/sqrt(6))*R_U;
T = [(sqrt(6)/12)*E_T , (sqrt(6)/4)*E_T, E_T];

% cube properties initialized
E_C = (2/sqrt(3))*T(1);
C = [.5*E_C , (sqrt(3)/2)*E_C , E_C]; 

% Octahedron properties are initialized
E_O = (2/sqrt(2))*C(1);
O = [(sqrt(6)/6)*E_O , (sqrt(2)/2)*E_O, E_O];

% Dodecahedron properties are initialized
E_D = (4/(sqrt(15) + sqrt(3)))*O(1);
D = [(sqrt(250 + 110*sqrt(5))/20)*E_D , ...
        ((sqrt(15) + sqrt(3))/4)*E_D, E_D];
    
% Icosahedron properties are initialized
E_I = (4/sqrt(10 + 2*sqrt(5)))*D(1);
I = [(sqrt(42 + 18*sqrt(5))/12)*E_I , ...
        (sqrt(10 + 2*sqrt(5))/4)*E_I, E_I];


% print edge, inneradius, outradius.

disp('solid           inradius    outradius   edge')
fprintf('\nTetrahedron %12.6f',T(1));
fprintf('%12.6f',T(2));
fprintf('%12.6f',T(3));
fprintf('\nCube        %12.6f',C(1));
fprintf('%12.6f',C(2));
fprintf('%12.6f',C(3));
fprintf('\nOctahedron  %12.6f',O(1));
fprintf('%12.6f',O(2));
fprintf('%12.6f',O(3));
fprintf('\nDodecahedron%12.6f',D(1));
fprintf('%12.6f',D(2));
fprintf('%12.6f',D(3));
fprintf('\nIscosahedron%12.6f',I(1));
fprintf('%12.6f',I(2));
fprintf('%12.6f',I(3));