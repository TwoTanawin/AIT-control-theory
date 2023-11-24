%% define parameter

A = [0 1; 20.6 0]

B = [0; 1]

C = [1 0]

%% step 1 regulator design

syms s g1 g2

G = [g1 g2]

Ac = A-(B*G)

%% step 2

syms s

I = eye(length(A))

SI_minus_Ac = (s*I)-Ac


%% step 3 

syms s

% Given equation
eq = (s + 1.8 + 2.4i)*(s + 1.8 - 2.4i)

ex = expand(eq)

a_bar = [3.6; 9] % from ex

% solve G by hand
G = [29.6 3.6]

%% step 4 observer design

syms k1 k2

K = [k1; k2]

A_hat = A-(K*C)

%% step 5

SI_minus_A_hat = (s*I)-A_hat


det_SI_minus_A_hat = det(SI_minus_A_hat)

% solve K by hand
K_by_hand = [16; 84.6]


%% step 6

Ac_hat = A-(B*G)-(K_by_hand*C)

% B.*G

%% step 7

SI_minus_Ac_hat = (s*I)-Ac_hat

det_SI_minus_Ac_hat = det(SI_minus_Ac_hat)

SI_minus_Ac_hat_hand = [s + 18/5 1; -468/5 s + 16]

%% step 8 

G_SI_minus_Ac_hat_hand_K = G*SI_minus_Ac_hat_hand*K_by_hand

%% step 9

 SI_A = ex

 SI_A_hat = s^2+16*s+64

 SI_A_SI_A_hat = expand(SI_A*SI_A_hat)

 %% step 10

 syms s t

% Define the Laplace domain function
F_s =  SI_A_SI_A_hat;

% Calculate the inverse Laplace transform
f_t = ilaplace(F_s);

% Display the result
disp('Inverse Laplace Transform:')
disp(f_t)

% If you want to simplify the result, you can use simplify function
f_t_simplified = simplify(f_t);
disp('Simplified Inverse Laplace Transform:')
disp(f_t_simplified)




