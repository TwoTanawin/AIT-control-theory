%% set parameter
syms  s

A = [0 1; 20.6 0]

b = [0; 1]

I = eye(length(A))

%% step 1

SI_minus_A = (s*I)-A

det_SI_minus_A = det (SI_minus_A)

a = [0; -20.6] % from det_SI_minus_A

%% step 2

Q = [b A*b]

W = [1 0; 0 1]

QW = Q*W

QW_trans = Q*W'

inv_QW_trans = inv(QW_trans)

%% step 3

syms s

% Given equation
eq = (s + 1.8 + 2.4i)*(s + 1.8 - 2.4i)

ex = expand(eq)

%% step 4

syms x1 x2

x = [x1; x2]

a_bar = [3.6; 9] % from ex manual define

g = inv_QW_trans*(a_bar-a)

u = -g'*x

%% step 5

Ac = A-(b*g')

%% step 6

SI_minus_Ac = (s*I)-Ac

%% step 7
syms g1 g2

g = [g1 g2]

final_step = (s*I)-(A-(b*g))

det_final_step = det(final_step)








