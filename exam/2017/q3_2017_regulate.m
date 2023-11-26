%% tf to ss

num = [150];
den = [1 1000]; % sort by degree s^2 s^1 s^0

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

syms p1 p2 p3 w q

% W = [0.0001]

P = [p1]

% V = [0.09]
% 
% F = [1]

Q = C'*C*q

R= [1]

G = inv(R)*B'*m1

%% step 3 : -M1 = M1A + AtM1 M1BG + Q

% assume m1 real

% assume(m1, 'real');

MA = m1*A

AtM = A'*m1

MBG = m1*B*G

M = -(MA + AtM - MBG + Q) %don't forget minus

solution1 = solve(M, m1)

solution1 = solution1(2)

pretty(solution1)

% Substitute the value of p1
G_value = subs(G, m1, solution1)


%% step 4 : charextoristic
syms s

I = eye(1)

q_val = 133.333

sI_minus_A = s*I - A + (B*G_value)

solution2 = subs(sI_minus_A, [q], q_val)

% pretty(simplify(sI_minus_A))

solve(solution2, s)


