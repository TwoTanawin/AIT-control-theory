%% tf to ss

num = [0.2];
den = [1 0.5 0]; % sort by degree s^2 s^1 s^0

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

%% tf to ss

num = [0.2];
den = [1 0.5 0]; % sort by degree s^2 s^1 s^0

G = tf(num, den); % convert to transfer function

[A_original, B_original, C_original, D_original] = tf2ss(num, den); % convert to state-space

% Permute rows and columns to match the desired format
A_desired = A_original([2, 1], [2, 1]);
B_desired = B_original([2, 1]);
C_desired = C_original([2, 1]);

disp('A desired:');
disp(A_desired);

disp('B desired:');
disp(B_desired);

disp('C desired:');
disp(C_desired);

disp('D desired:');
disp(D_original);