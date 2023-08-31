% Define the transfer function G(s)
numerator = [1, 3]; % Coefficients of the numerator polynomial
denominator = [1, -1, 0]; % Coefficients of the denominator polynomial

% Create a transfer function object
sys = tf(numerator, denominator);

% Plot the Bode diagram
bode(numerator, denominator)
