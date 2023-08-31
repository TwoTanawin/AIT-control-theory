% Create an array of angles for the circle
theta_circle = linspace(0, 2*pi, 1000);

% Define the radius of the circle
radius = 1;

% Calculate the x and y coordinates of the circle
x_circle = radius * cos(theta_circle);
y_circle = radius * sin(theta_circle);

% Create a figure for the circle
figure;
hold on;

% Plot the circle
plot(x_circle, y_circle, 'b', 'LineWidth', 2);

% Plot the line at 255 degrees
theta_line = deg2rad(225);
x_line = [0, radius * cos(theta_line)];
y_line = [0, radius * sin(theta_line)];
plot(x_line, y_line, 'r--', 'LineWidth', 2);

% Set plot properties
axis equal;
grid on;
title('Circle and Line Plot');
xlabel('X-axis');
ylabel('Y-axis');
legend('Circle', '255 Degree Line');

% Display the plot
hold off;

