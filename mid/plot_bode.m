numerator = [1];
denominator = [30];
sys = tf(numerator, denominator);


bode(sys, {0.1, 100});  % Adjust frequency range from 0.1 to 100 rad/s
grid on;                % Enable grid
title('Bode Plot');     % Set plot title
xlabel('Frequency (rad/s)'); % Set x-axis label
ylabel('Magnitude (dB) / Phase (degrees)'); % Set y-axis label
