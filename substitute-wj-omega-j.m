syms s w k;

% Define the polynomial expression
p = s^4 + 3*s^3 + 3*s^2 + 2*s + k;

% Substitute s = jω
p_substituted = subs(p, s, 1i*w);

% Calculate the frequency response P(jω)
P_jw = simplify(p_substituted);

% Display the frequency response
disp('Frequency response P(jω):');
disp(P_jw);
