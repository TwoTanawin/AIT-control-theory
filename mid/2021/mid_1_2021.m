syms t s;

disp("######### Define function #########")
disp(" ")
v_t = 5*exp(-0.1*t)*sin(0.2*t);
V_s = laplace(v_t, t, s);
disp(" ")

disp(V_s);

disp("############ Step 1 ############")
pretty(V_s)

G = 4/(20*s^2+10*s)

disp("############ Step 2 ############")
x = G*V_s

pretty(x)

disp("############ Step 3 ############")
result = partfrac(x)

pretty(result)

disp("############ Step 4 ############")
ilaplace(result)

pretty(simplify(ilaplace(result)))
