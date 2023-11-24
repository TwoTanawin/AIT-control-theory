% Define a symbolic variable 's'
syms s

% Define the transfer function
numerator = 1;
denominator = 78.4*s + 119.6;
transfer_function = numerator / denominator;

% Define the input signal
input_signal = 1 / s;

% Calculate the final value using the limit
final_value = limit(s * transfer_function * input_signal, s, 0);

% Display the result
fprintf('Final Value: %s\n', char(final_value));
