%% define parameter

syms g1 g2

A = [0 1; 20.6 0]

B = [0 0; 1 2]

G = [g1 0;0 g2]

%% step 1

Ac = A-(B*G)

%% step 2

syms s

I = eye(length(A))

SI_minus_Ac = (s*I)-Ac

a_bar =  [2*g2; g1 - 103/5]

%% step 3

syms s

% Given equation
eq = (s + 1.8 + 2.4i)*(s + 1.8 - 2.4i)

ex = expand(eq)

%% step 4

