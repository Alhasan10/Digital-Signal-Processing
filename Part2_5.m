% Assume the ECG data is already loaded in the workspace as:
% temp_ECG1, temp_ECG2, A_ECG1, A2_ECG1, A_ECG2, A2_ECG2

% Define the high-pass filter coefficients
b_hp = [1, zeros(1, 15), -1, zeros(1, 15), 1/32];
a_hp = [1, -1, zeros(1, 15), 1/32];

% Define the length of prepending (using a multiple of the filter length for good measure)
prepend_length = 32;

% Prepend the ECG signals with their initial values to reduce startup transients
X_prepended_ECG1 = [repmat(A2_ECG1(1), prepend_length, 1); A2_ECG1];
X_prepended_ECG2 = [repmat(A2_ECG2(1), prepend_length, 1); A2_ECG2];

% Apply the high-pass filter to the prepended ECG signals
HP_ECG1_prepended = filter(b_hp, a_hp, X_prepended_ECG1);
HP_ECG2_prepended = filter(b_hp, a_hp, X_prepended_ECG2);

% Remove the prepended part
HP_ECG1 = HP_ECG1_prepended(prepend_length+1:end);
HP_ECG2 = HP_ECG2_prepended(prepend_length+1:end);

% Plot the high-pass filtered signals
figure;
subplot(2, 1, 1);
plot(temp_ECG1, HP_ECG1);
title('High-Pass Filtered ECG1 (with prepended values)');
xlabel('Time');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(temp_ECG2, HP_ECG2);
title('High-Pass Filtered ECG2 (with prepended values)');
xlabel('Time');
ylabel('Amplitude');
