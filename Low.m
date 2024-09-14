% Assume the ECG data is already loaded in the workspace as:
% temp_ECG1, temp_ECG2, A_ECG1, A2_ECG1, A_ECG2, A2_ECG2

% Define the low-pass filter coefficients
b_lp = [1, zeros(1, 5), -2, zeros(1, 5), 1];
a_lp = [1, -2, 1];

% Define the length of prepending (using a multiple of the filter length for good measure)
prepend_length = 12;

% Prepend the ECG signals with their initial values to reduce startup transients
X_prepended_ECG1 = [repmat(A2_ECG1(1), prepend_length, 1); A2_ECG1];
X_prepended_ECG2 = [repmat(A2_ECG2(1), prepend_length, 1); A2_ECG2];

% Apply the low-pass filter to the prepended ECG signals
LP_ECG1_prepended = filter(b_lp, a_lp, X_prepended_ECG1);
LP_ECG2_prepended = filter(b_lp, a_lp, X_prepended_ECG2);

% Remove the prepended part
LP_ECG1 = LP_ECG1_prepended(prepend_length+1:end);
LP_ECG2 = LP_ECG2_prepended(prepend_length+1:end);

% Generate time vectors based on the length of the signals
fs = 360; % Sampling frequency
t1 = (0:length(LP_ECG1)-1) / fs;
t2 = (0:length(LP_ECG2)-1) / fs;

% Create time vectors for the first 5 seconds
t_5sec1 = t1(t1 < 5);
t_5sec2 = t2(t2 < 5);

% Extract the corresponding signal parts for the first 5 seconds
LP_ECG1_5sec = LP_ECG1(t1 < 5);
LP_ECG2_5sec = LP_ECG2(t2 < 5);

% Plot the low-pass filtered signals for ECG1
figure;
subplot(2, 1, 1);
plot(t1, LP_ECG1);
title('Low-pass Filtered ECG1 Signal');
xlabel('Time (s)');
ylabel('Amplitude (mV)');

subplot(2, 1, 2);
plot(t_5sec1, LP_ECG1_5sec, '-r');
title('Low-pass Filtered ECG1 Signal (First 5 Seconds)');
xlabel('Time (s)');
ylabel('Amplitude (mV)');

% Plot the low-pass filtered signals for ECG2
figure;
subplot(2, 1, 1);
plot(t2, LP_ECG2);
title('Low-pass Filtered ECG2 Signal');
xlabel('Time (s)');
ylabel('Amplitude (mV)');

subplot(2, 1, 2);
plot(t_5sec2, LP_ECG2_5sec, '-r');
title('Low-pass Filtered ECG2 Signal (First 5 Seconds)');
xlabel('Time (s)');
ylabel('Amplitude (mV)');

% Optionally, plot the original and low-pass filtered signals for comparison
figure;
subplot(2, 1, 1);
plot(t2, A2_ECG2);
title('ECG2 Original');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(t2, LP_ECG2, '-r');
title('Low-pass Filtered ECG2');
xlabel('Time (s)');
ylabel('Amplitude');
