% Define the transfer function
num = [1];
den = [1, 3, 3, 2, 0];  % Coefficients for the denominator
sys = tf(num, den);

% Plot the root locus
rlocus(sys);
grid on;
title('Root Locus Plot');


