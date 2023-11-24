% Define the transfer function
numerator = [1];
denominator = [30, 1];
sys = tf(numerator, denominator);

% Create the root locus plot
rlocus(sys);

% Add labels and a title
xlabel('Real');
ylabel('Imaginary');
title('Root Locus Plot');

% If you want to customize the plot further, you can do so here.

% If you want to save the plot as an image file, you can use the 'saveas' function:
% saveas(gcf, 'root_locus_plot.png');
