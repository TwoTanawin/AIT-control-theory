s = tf('s');
G = 1 / (1);

[magnitude, phase, frequency] = bode(G);

% Extract magnitude and phase data from the 3D array
magnitude = squeeze(magnitude);
phase = squeeze(phase);

% Plot the magnitude and phase Bode plots
subplot(2, 1, 1);  % Create a subplot for magnitude
semilogx(frequency, 20*log10(magnitude));  % Plot in dB
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Magnitude Bode Plot');

subplot(2, 1, 2);  % Create a subplot for phase
semilogx(frequency, phase);
grid on;
xlabel('Frequency (Hz)');
ylabel('Phase (degrees)');
title('Phase Bode Plot');
