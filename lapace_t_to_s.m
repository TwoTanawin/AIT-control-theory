syms t s;
v_t = 5*exp(-0.1*t)*sin(0.2*t);
V_s = laplace(v_t, t, s);

disp(V_s);

pretty(V_s)