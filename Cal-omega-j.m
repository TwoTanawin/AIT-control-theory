% Step 1: Define symbolic variable
syms w

% Step 2: Define the equation
equation = -3*w^3 + 2*w;

% Step 3: Solve the equation
solutions = solve(equation, w);

% Step 4: Display the exact solutions
disp("Exact Solutions:");
disp(solutions);

% Step 5: Convert to decimal approximations
decimal_solutions = vpa(solutions);

% Step 6: Display decimal solutions
disp("Decimal Approximations:");
disp(decimal_solutions);

