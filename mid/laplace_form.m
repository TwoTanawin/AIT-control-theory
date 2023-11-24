syms s A k g h0 Q H p

% Define the Laplace-transformed equation
eqn = Q == A*s*H - A*h0 + k*p*g*H;

% Solve for H(s)
Hs = solve(eqn, H);

% Display the result
Hs
