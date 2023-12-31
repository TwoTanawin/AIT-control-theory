%% tf to ss

num = [0.2];
den = [1 0.5 0]; % sort by degree s^2 s^1 s^0

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

%% step 1

syms p1 p2 p3

P = [p1 p2; p2 p3]

C = C_desired

W = [1]

F = [0; 1]

inv_W = inv(W) 

K = P.*C*inv_W

%% step 2

% assume(p2, 'real');
assume(p1, 'real');
assume(p2, 'real');
assume(p3, 'real');

V = [10]


A = A_desired

AP =A*P

new_A = A.'
% 
Pnew_A = P*new_A
% % 
KCP = K.*C*P

FVF = F*V*F'

P_bar = AP + Pnew_A - KCP + FVF

% Solve for the variables p1, p2, p3
solution = solve(P_bar == 0, [p1, p2, p3]);

p1_val = double((solution.p1))
p2_val = double((solution.p2))
p3_val = double((solution.p3))

p1_val = double((solution.p1(2)))
p2_val = double((solution.p2(2)))
p3_val = double((solution.p3(2)))

K_val = double(subs(K, [p1 p2 p3], [p1_val p2_val p3_val]))

%% step 2 : characteristic

syms s

I = eye(2)

sI_minus_A = (s*I)-A+(K_val.*C)

det_sI_minus_A = det(sI_minus_A)







