syms s
H = 1 / (78.4 * s + 119.6);
final_value = limit(H, s, 0);
disp('Final Value:');
disp(final_value*100);
