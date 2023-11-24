syms s a b w


Hs = ((-w*1i+a)*(-w*1i+b))*((w*1i+a)*(w*1i+b))

Hs_sim = simplify(Hs)

Hs_ex = expand(Hs_sim)

Hs_ex_sim = simplify(Hs_ex)