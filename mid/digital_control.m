% Example usage:
Gz_numerator = [0.2];
Gz_denominator = [1 0.5 0];

Tc_numerator = [1 2];
Tc_denominator = [1 6 5];

Ts = 0.1;

Gz = zoh_discretize(Gz_numerator, Gz_denominator, Ts);

Tc = zoh_discretize(Tc_numerator, Tc_denominator, Ts);

Gz

Tc

Gc = Tc/(Gz*(1-Tc))

% Manually simplify the transfer function
[num, den] = tfdata(Gc, 'v');
simplified_num = simplify_poly(num);
simplified_den = simplify_poly(den);

% Create the simplified transfer function
Gc_simplified = tf(simplified_num, simplified_den);

Gc_simplified;

% Define a function to simplify a polynomial
function simplified_poly = simplify_poly(poly)
    % Remove leading zeros
    while poly(1) == 0
        poly(1) = [];
    end
    simplified_poly = poly;
end


function sys_discrete_zoh = zoh_discretize(num, den, Ts)
    % Create the continuous-time transfer function
    sys_continuous = tf(num, den);
    
    % Convert the continuous-time transfer function to a discrete-time system using ZOH
    sys_discrete_zoh = c2d(sys_continuous, Ts, 'zoh');
    
end
