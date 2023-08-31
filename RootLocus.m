ps = [-1 1]
qs = conv([1 0],[1 5])

CHE = tf(ps,qs) % Caracteristic Eqn

 rlocus(CHE)

[k, p] = rlocfind(ps,qs)

% k = [0 1 3 5 7]
% 
% rlocus(CHE, k)