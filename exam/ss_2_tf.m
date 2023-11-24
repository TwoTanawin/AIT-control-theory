syms s

A = [0 1 0; 0 0 1; -5 -2 -2]

B = [0; 0; 1]

C = [1 0 0; 0 1 -2; 3 0 2]

D = [0; 0; 0]

%% step 2

SI = eye(length(A));

SI = SI*s

SI_minus_A = SI-A

% INV_SI_minus_A = inv(SI_minus_A)

det_SI_A = det(SI_minus_A)

den = [1 2 2 5]

% test = SI_minus_A^-1
transfer_function = tf(1, den)
%% step 3

% a from det_SI_A
a1 = 2

a2 = 2
% config parameter

I = eye(length(SI_minus_A))

E1 = eye(length(SI_minus_A))

E2 = (A*E1)+(a1*I)

E3 = (A*E2)+(a2*I)
 
E = (I*s^2)+(E2*s)+(E3)


%% step 4

Hs = C*E*B




