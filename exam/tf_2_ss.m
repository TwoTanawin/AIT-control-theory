%% tf to ss

num = [1];
den = [78.4 19.6]; % sort by degree s^2 s^1 s^0

G = tf(num, den) % convert to transfer function
 
[A, B, C, D] = tf2ss(num, den) % convert to stat space

disp('A matrix:');
disp(A);

disp('B matrix:');
disp(B);

disp('C matrix:');
disp(C);

disp('D matrix:');
disp(D);

%%

% Define the transfer function coefficients
numerator = [1 2];      % Example numerator coefficients
denominator = [1 3 2];   % Example denominator coefficients

% Convert transfer function to state-space representation
[A, B, C, D] = tf2ss(numerator, denominator);

% Convert state-space representation to transfer function
[num_out, den_out] = ss2tf(A, B, C, D);

% Display the companion form coefficients
disp('Companion Form Coefficients:');
disp('A ='); disp(A);
disp('B ='); disp(B);
disp('C ='); disp(C);
disp('D ='); disp(D);

% Display the transfer function coefficients
disp('Transfer Function Coefficients:');
disp('Numerator Coefficients:'); disp(num_out);
disp('Denominator Coefficients:'); disp(den_out);


