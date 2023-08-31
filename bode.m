numerator = [1 3]; % Coefficients of 's' and constant term in the numerator
denominator = [1 -1 0]; % Coefficients of 's^2', 's', and constant term in the denominator
H = tf(numerator, denominator);

bode(H)