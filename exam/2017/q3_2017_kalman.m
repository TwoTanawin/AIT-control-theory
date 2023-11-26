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



%% step 1

syms w p1 v

W = [w]

P = [p1]

V = [v]

F = [1]

inv_W = inv(W) 

K = P*C*inv_W

%% step 2

AP =A*P

%% step 3

PA_trans = P*A'

%% step 4 

KCP = K*C*P


%% step 5

FVF = F*V*F


%% step 6 : P = AP + PAt - KCP + FVF 

P_bar = simplify(AP + PA_trans - KCP + FVF)

%% step 7 slove p

solution1 = solve(P_bar, p1)

solution1 = simplify(solution1(1))

pretty(simplify(solution1(1)))

%% step 8 solve K

% Substitute the value of p1
K_value = subs(K, p1, solution1(1))

% Display the result
% disp(double(K_value));

%% step 9

syms s

I = eye(1)

KC = K_value*C

sI_minus_A = (s*I) - A + KC

disp(sI_minus_A)

pretty(sI_minus_A)

