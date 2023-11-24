%% define parameter
syms p1 p2 p3 w

A = [0 1; 20.6 0]

B = [0; 1]

C = [0 1]

W = [w]

P = [p1 p2; p2 p3]

V = [0; 1]

%% step 1

AP = A*P

%% step 2

PA_trans = P*A'

%% step 3
% K = PC'W^-1


inv_W = inv(W)

K = P*C'*inv_W

%% step 4

Kc = K*C


%% step 5

Kpc = Kc*P

%% step 6

% FVF'

syms v

F = [0; 1]

FVF = (V*F')*v

%% step 7

kalman = AP+PA_trans-Kpc+FVF


kalman_sim = simplify(kalman)

%% step 8

solve_p2 = solve(kalman(1), p2)



%% step 9

p2 = solve_p2(2)
% kalman(4)

solve_p3 = solve(kalman(4), p3)

solve_p3_sim = simplify(solve_p3)

%% step 10

K1 = 2*w
K2 = sqrt((82.4*w^2)+v*w)

%% step 11

K_F = [2; sqrt(84.4)]

A_hat = A-(K_F*C)

%% step 12

syms s

I = eye(length(A))

SI_minus_A_hat = (s*I)-A_hat

det_SI_minus_A_hat = det(SI_minus_A_hat)

det_SI_minus_A_hat_sim = double(simplify(det_SI_minus_A_hat))
 