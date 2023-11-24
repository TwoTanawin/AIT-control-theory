syms k s

G = 4/(20*s^2+10*s)

Gs = G*k/(1+k*G)

simplify(Gs)

disp("############ Step 1 ############")
pretty(simplify(Gs))

% Calculate s*H(s)
sH_s = s * Gs;

% Calculate the limit as s approaches 0
final_value = limit(Gs, s, 0);

disp("############ Step 2 ############")
% Display the final value
disp(final_value);


disp("############ Step 3 ############")
% Define the transfer function
G = tf([4], [20, 10, 0]);

% Extract zeros, poles, and the gain factor
[z, p, k] = zpkdata(G, 'v');

% Display the zeros, poles, and gain factor
disp('Zeros:');
disp(z);
disp('Poles:');
disp(p);
disp('Gain Factor:');
disp(k);




