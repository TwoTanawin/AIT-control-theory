%% tf to ss

num = [1];
den = [30 1 0]; % sort by degree s^2 s^1 s^0

G = tf(num, den); % convert to transfer function

[A_original, B_original, C_original, D_original] = tf2ss(num, den); % convert to state-space

% Permute rows and columns to match the desired format
A_desired = A_original([2, 1], [2, 1]);
B_desired = B_original([2, 1]);
C_desired = C_original([2, 1]);

disp('A desired:');
disp(A_desired);

disp('B desired:');
disp(B_desired);

disp('C desired:');
disp(C_desired);

disp('D desired:');
disp(D_original);

%% define parameter

A = A_desired

B = B_desired

C = C_desired

%% step 1

syms s

I = eye(length(A))

SI_minus_A = (s*I)-A

det_SI_minus_A = det(SI_minus_A)

a = [0; -20.6] % from det_SI_minus_A

%% step 3

N = [C' (A'*C')]

%% step 4

W = [1 0;0 1]

NW = N*W

inv_trans_NW = inv(NW')

%% step 5

syms s

% Given equation
eq = (s + 1.8 + 2.4i)*(s + 1.8 - 2.4i)

ex = expand(eq)

a_bar = [3.6; 9] % from ex

%% step 6

K = inv_trans_NW*(a_bar-a)

%% state x hat step 1.2

A_hat = [A-(K*C)]

%% step 2.2

syms s

I = eye(length(A))

SI_minus_A_hat = (s*I)-A_hat

det_SI_minus_A_hat = det(SI_minus_A_hat)

%% step 3.2

SI_A_hat_inv = SI_minus_A_hat\eye(length(SI_minus_A_hat))


