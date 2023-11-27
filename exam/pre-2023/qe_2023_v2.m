syms l1 l2

F = [-0.0333]-[l1 l2]*[1 0;0 1].*[0 1]


%% 

sf = -10-[5.1]+[l1 l2]*[1 0;1 1].*[0 1] == 0

solve(sf,[l1 l2])

sf.l1(1)

sf.l2(1)

%%
syms s

s1 = s+0.0333+l2

solution_s1 = solve(s1,l2)

%%

g_bar = ([0 -0.0333]-[0 4.9]*[1 0; 0 1]*[0 1; 0 0])*inv([1 0; 0 1])

%%

H = [1]-[0 4.9].*[1 0; 0 1].*[0 0]