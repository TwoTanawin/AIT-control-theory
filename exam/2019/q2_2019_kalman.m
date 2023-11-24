%% define parameter
syms p1 p2 p3 w

A = [-0.25]

B = [1]

C = [0.0128]

W = [0.0001]

P = [p1]

V = [0.09]

F = [1]

%% step 1

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

solution1 = solve(P_bar, p1);

disp(double(solution1))

%% step 8 solve K

% Substitute the value of p1
K_value = subs(K, p1, double(max(solution1)));

% Display the result
disp(double(K_value));

%% step 9

syms s

I = eye(1)

KC = double(K_value*C)

sI_minus_A = (s*I) - A + KC


















