%% tf to ss

num = [1];
den = [30 1]; % sort by degree s^2 s^1 s^0

G = tf(num, den) % convert to transfer function
 
[A, B, C, D] = tf2ss(num, den) % convert to stat space

disp('A matrix:');
disp(A);

disp('B matrix:');
disp(B);

disp('C matrix:');
disp(C);

disp('D matrix:');
disp(D);

%% step 2

syms m1 

R = [1]

Q = (C'*C)*4

G = inv(R)*B'*m1

%% step 3 : -M1 = M1A + AtM1 M1BG + Q

% assume m1 real

% assume(m1, 'real');

MA = m1*A

AtM = A'*m1

MBG = m1*B*G

M = -(MA + AtM - MBG + Q) %don't forget minus

solution1 = solve(M, m1)

solution1 = double(max(solution1))

% Substitute the value of p1
G_value = subs(G, m1, double(max(solution1)))

G_value = double(G_value)

% Display the result
% disp(double(G_value));

%% step 4 : -M2 = M1E + M2A + (At - GB)M2

syms m2

A0 = 0

M1_val = solution1

MA = M1_val*A

M2A0 = m2*A0

At = A'

GB = G_value*B

M2 = -(MA + M2A0 + ((At - GB)*m2))

pretty(M2)

solution2 = solve(M2,m2)

M2_val = double(solution2)

G0_value = subs(G, m1, M2_val)

G0_value = double(G0_value)

%% step 5 : charactoristic

syms s

I = eye(1)

sI_minus_A = s*I - A + (B*G_value)

pretty(simplify(sI_minus_A))



