%% tf to ss

num = [150];
den = [1 1000]; % sort by degree s^2 s^1 s^0

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

