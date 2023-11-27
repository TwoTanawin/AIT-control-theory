syms s g1

Ac = [-0.0333]*[1]*[g1]

sI_minus_A = [s]-Ac

s_val = 5

solution_1 = subs(sI_minus_A,[s],s_val)

solv1 = solve(solution_1, g1)


%%

syms k1

A_hat = [-0.0333]*[k1]*[0.0333 0]


sI_minus_A_hat = [s]-A_hat


det


