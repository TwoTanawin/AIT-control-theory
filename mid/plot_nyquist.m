% Define the transfer function
numerator = [1];
denominator = [78.4, 19.6];
sys = tf(numerator, denominator);

% Create the Nyquist plot
nyquist(sys);

% Add labels and a title
xlabel('Real');
ylabel('Imaginary');
title('Nyquist Plot');

% If you want to limit the frequency range of the plot, you can do this:
% nyquist(sys, w); % Replace 'w' with the desired frequency range

% If you want to save the plot as an image file, you can use the 'saveas' function:
% saveas(gcf, 'nyquist_plot.png');
