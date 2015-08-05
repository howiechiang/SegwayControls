clear;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Variable Initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%syms theta;            % ~ % Platform deviation from vertical
%syms x;                % ~ % Horizontal displacement of Segway vehicle
%syms V;                % ~ % Motor voltage
%syms T;                % ~ % Motor torque
%syms d;                % ~ % Horizontal displacement of rider load/mass (m)

R = 0.5;            % C % Wheel radius (m)
L = 0.4;            % C % Distance from wheel centerline to center of mass (m)
l = 1;              % C % Distance from wheel centerline to rider load/mass (m)
M = 55;             % C % System (vehicle) mass (~120 lbs)
m = 68;             % C % Rider (load) mass(N) (~150 lbs)
k_t = 0.75;         % C % Torque constant (N*m/A)
k_bemf = 0.5;       % C % Back emf constant (V*sec)
r_a = 1.4;          % C % Armature resistance
c1 = 0.01;          % C % Small rotational damping with appropriate units
c2 = 0.01;          % C % Small linear damping with appropriate units
g = 9.81;           % C % Gravitational acceleration (m*s^2)
J = M*L^2+m*l^2;            % C % Moment of inertia related to all the mass rotating around the wheels (kg*m^2)(calculated)
alpha = k_t/r_a;            % C % Motor constant (calculated)
beta = k_t*k_bemf/(R*r_a);  % C % Motor constant (calculated)




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Root Locus analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s = tf('s');

G_V = (-alpha*((M+m)*s + c2))/((J*s^2-M*g*L-m*g*l+c1*s)*((M+m)*s+beta/R+c2));
G_D = (m*g)/(J*s^2-M*g*L-m*g*l+c1*s);

G = (G_V);


TF1 = (G/(1+G));

LC = ((s-10))/((s+20)*(s+1));

TF2 = (LC*G)/(1+(LC*G));

TF3 = (G)/(1 + LC*G);




rlocus(TF2);
%figure(3);
%rlocus(TF3);





% First Round of PID Gain Refinement
% ki = 20; kd = 80;
%{
N = [32.00625 0.283875 0];
D = [4628.736 2601.79902 -53189.66770 172.2762 5.6775];
rlocus(N,D);
grid on;
%}

% kp = 1750; kd = 80;
%{
N = [32.0062 0.283875];
D = [4628.736 2601.79902 2821.2698 28.93254 0];
rlocus(N,D);
grid on;
%}

% kp = 1750; ki = 14;
%{
N = [32.00625 .28387 0 0];
D = [4628.736 41.2990 2798.5598 477.02004 3.97425];
rlocus(N,D);
grid on;
%}



