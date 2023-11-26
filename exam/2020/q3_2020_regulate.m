%% tf to ss

num = [1 2];
den = [1 6 5]; % sort by degree s^2 s^1 s^0

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

syms m1 m2 m3

Q = C_desired'*C_desired

R = [1]

M = [m1 m2; m2 m3]

G = inv(R)*B_desired'*M

%% step 2 : -M1 = M1A + AtM1 M1BG + Q

% assume m1 real
% assume(m1, 'real');
% assume(m2, 'real');
% assume(m3, 'real');

A = A_desired

B = B_desired

MA = M*A

AtM = A'*M

MBG = M*B*G

M_val = -(MA + AtM - MBG + Q) %don't forget minus

solution_m2 = solve(M_val(1,1), m2)

m2_val = double(max(solution_m2))

M_val(2,2)

solution_m3 = solve(M_val(2,2), m3)

m3_val = subs(solution_m3, m2_val)

m3_val = double(max(m3_val))

% m2 = m2_val
% 
% m3 = m3_val

eqn_m1 = M_val(1,2) == 0


solution_m1 = solve(eqn_m1, m1)


m1_val = subs(solution_m1, [m2, m3], [m2_val, m3_val]);

m1_val = double(m1_val)

G_val = subs(G, [m2, m3],[m2_val m3_val])

G_val = double(G_val)

Ac = A-B*G_val

M1 = double(subs(M, [m1, m2, m3], [m1_val, m2_val, m3_val]))


%% step 3 : -M2 = M1E + M2A + (At - GB)M2

syms m21 m22 m23 m24

A0 = zeros(2, 2)

M2 = [m21 m22; m23 m24]

G0 = inv(R)*B'*M2


M1A = M1*A

M2A0 = M2*A0

At = A'

GB = G_val*B

% (At - GB)*M2
new_Ac = Ac.'

M2 = M1A + (new_Ac*M2) == 0

solve_M2 = solve(M2, [m21 m22 m23 m24])

m21_val = double(solve_M2.m21) % get value from struc

m22_val = double(solve_M2.m22) % get value from struc

m23_val = double(solve_M2.m23) % get value from struc

m24_val = double(solve_M2.m24) % get value from struc

G0_val = double(subs(G0, [m21 m22 m23 m24], [m21_val m22_val m23_val m24_val]))


%% step 4 : characteristic

syms s

I = eye(length(A))

sI_minus_Ac = (s*I)-Ac

det_sI_minus_Ac = det(sI_minus_Ac)

pretty(det_sI_minus_Ac)
