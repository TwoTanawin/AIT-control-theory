syms s t
F = 0.346939/(s + 0.25) + 0.153061/s;
f = ilaplace(F, s, t);

% Find the steady-state value (as t approaches infinity)
steady_state_value = limit(f, t, inf);

% Convert the symbolic result to a double
steady_state_double = double(steady_state_value);

% Define a time vector for plotting
time = 0:0.01:10; % Adjust the time range as needed

% Evaluate the symbolic expression at the specified time points
output = subs(f, t, time);

% Plot the symbolic expression and the steady-state value
figure;
subplot(2, 1, 1);
plot(time, output);
title('System Output vs. Time');
xlabel('Time');
ylabel('Output');

subplot(2, 1, 2);
plot([0, time(end)], [steady_state_double, steady_state_double], 'r--');
title('Steady-State Value');
xlabel('Time');
ylabel('Steady-State Value');
