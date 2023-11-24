%% define parameter
syms m1 m2 m3

A = [0 1; 20.6 0]

B = [0; 1]

C = [1 0]

Q = [1 0; 0 0]

R = [1]

M = [m1 m2; m2 m3]

%% step 1

G = inv(R)*B'*M

%% step 2

Ac = A-(B*G)

%% step 3

MAc = simplify(M*Ac)
%% step 4
assume(m1, 'real');
assume(m2, 'real');
assume(m3, 'real');

Ac_trans = Ac'

Ac_trans = simplify(Ac_trans)

Ac_trans_M = Ac'*M

%% step 5

G_trans_R_G = G'*G

%% step 6

minus_M_dot = simplify(MAc+Ac_trans_M+Q+G_trans_R_G)


for i = 1:4
    disp("eqn : "+num2str(i))
    disp(minus_M_dot(i))
end

