syms s t
F = 0.346939/(s + 0.25) + 0.153061/s;
f = ilaplace(F, s, t);

% Find the steady-state value (as t approaches infinity)
steady_state_value = limit(f, t, inf);

% Convert the symbolic result to a double
steady_state_double = double(steady_state_value);

% Display the double value
disp(['Steady-State Value (Double): ', num2str(steady_state_double)]);
