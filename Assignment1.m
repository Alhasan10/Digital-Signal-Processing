% Number of samples
n = 0:299;

% Envelope function
M = 60;
w = zeros(size(n));
w(n <= M) = 0.54 - 0.46 * cos(2 * pi * n(n <= M) / M);

% Sinusoids
x1 = w .* cos(0.2 * pi * n);
x2 = w .* cos(0.4 * pi * n - pi/2);
x3 = w .* cos(0.8 * pi * n + pi/5);

% Composite signal
x = zeros(size(n));
x(1:M+1) = x3(1:M+1);
x(M+1:2*M+1) = x1(1:M+1);
x(2*M+1:3*M+1) = x2(1:M+1);


% Define filter specifications
order = 3;
cutoff_frequency = 0.2; % Example cutoff, adjust as necessary

% Generate the filter coefficients
[b, a] = butter(order, cutoff_frequency);

% Filter the signal x[n]
y = filter(inverse_H2, x);

% Plotting the output signal
figure;
plot(n, y);
title('Inverse for H2(z) - Alhasan 1211705');
xlabel('Sample number (n)');
ylabel('Amp');
grid on;
ylim([-1500 2000]);  % Set y-axis limit to 20
xlim([0 300]);  % Set x-axis to show from -π to π




