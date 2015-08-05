%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bonus - Observer Design
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A = [0 1 0; (L*(M*g+m*g)/J) (-c1/J) (k_t*k_bemf/(R*r_a*J)); 0 0 -(k_t*k_bemf+c2*R^2*r_a)/(R^2*r_a*(M+m))];
B = [0; (-k_t/(r_a*J)); (k_t/(r_a*R*(M+m)))];
T = [0 m*g/J 0];

C = [1 0 0];
D = 0;


At = transpose(A);
Ct = transpose(C);


p1 = -100 + 5i;
p2 = -100 - 5i;
p3 = -500;

K1 = transpose(acker(At,Ct,[p1 p2 p3]));

disp('Observer gains');
disp(K1(1,1));
disp(K1(2,1));
disp(K1(3,1));