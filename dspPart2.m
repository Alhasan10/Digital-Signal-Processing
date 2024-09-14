syms z

% Define the high-pass filter transfer function
HP_z = ((1/32)*z^(-32) + z^(-16) - (1/32) - z^(-17)) / (1 - z^(-1));

% Simplify the transfer function
H_z_simplified = simplify(HP_z);

% Convert to a MATLAB function for numerical evaluation
H_z_func = matlabFunction(H_z_simplified, 'Vars', {z});

% Numerical values for frequency response
N = 1000; % Number of points for frequency response
w = linspace(0, pi, N); % Frequency vector from 0 to pi

% Evaluate H(z) at complex frequencies
H_z_values = H_z_func(exp(1i*w));

% Plot frequency response
figure;
plot(w, 20*log10(abs(H_z_values)));
title('Frequency Response of High-Pass Filter Transfer Function');
xlabel('Frequency (rad/sample)');
ylabel('Magnitude (dB)');
grid on;

% Print the transfer function
disp('Transfer Function:');
disp(H_z_simplified);


%TRansfer function for Low Pass filter ****************************
syms z

% Define the low-pass filter transfer function
LP_z = (1 - 2*z^(-6) + z^(-12)) / (1 - 2*z^(-1) + z^(-2));

% Simplify the transfer function
LP_z_simplified = simplify(LP_z);

% Convert to a MATLAB function for numerical evaluation
LP_z_func = matlabFunction(LP_z_simplified, 'Vars', {z});

% Numerical values for frequency response
N = 1000; % Number of points for frequency response
w = linspace(0, pi, N); % Frequency vector from 0 to pi

% Evaluate L(z) at complex frequencies
LP_z_values = LP_z_func(exp(1i*w));

% Plot frequency response
figure;
plot(w, 20*log10(abs(LP_z_values)));
title('Frequency Response of Low-Pass Filter Transfer Function');
xlabel('Frequency (rad/sample)');
ylabel('Magnitude (dB)');
grid on;

% Print the transfer function
disp('Transfer Function:');
disp(LP_z_simplified);