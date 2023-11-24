%% define parameter
syms m1 m2 m3

A = [0 1; 20.6 0]

B = [0; 1]

C = [1 0]

Q = [1 0; 0 0]

R = [1]

M = [m1 m2; m2 m3]

%% step 1

G_hat = inv(R)*B'*M

%% step 2

MA = M*A

%% step 3

A_trans_M = A'*M

%% step 4

MBG = M*B*G_hat

%% step 5

MA_plus_A_trans_M = MA+A_trans_M

%% step 6

MBG_plus_Q = MBG+Q

%% step 7

MA_plus_A_trans_M_minus_MBG_plus_Q = MA_plus_A_trans_M-MBG_plus_Q

%% step 8 define eqn from step 7

eqn1 = -m2^2+41.2*m2-1

eqn2 = m1+20.6*m3+m2*m3

eqn3 = -m3^2+2*m2

%% step 9

solve_m2 = solve(eqn1, m2)

simf_solve_m2 = simplify(solve_m2)

% Display the floating-point values
disp('Simplified and Floating-Point Solutions:');
disp(double(max(simf_solve_m2)));
%% step 10
% 
% m2 = max(simf_solve_m2)
% 
% eqn3 = -m3^2+2*m2
% 
% solve_m3 = solve(eqn3, m3) 

g1 = 41.17
g2 = 9.07

G = [g1 g2]

Ac = A-(B*G)

%% step 11

syms s

I = eye(length(A))

SI_minus_Ac = (s*I)-Ac


det_SI_minus_Ac = det(SI_minus_Ac)

simf_SI_minus_Ac = simplify(det_SI_minus_Ac)

%% step 12

% Find the roots (solutions) of the characteristic equation
roots_of_characteristic_eq = solve(simf_SI_minus_Ac, s);

% Display the roots
disp('Roots of the characteristic equation:');
disp(double(roots_of_characteristic_eq));
