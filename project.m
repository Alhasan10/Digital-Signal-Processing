
t_5sec1=temp_ECG1.*(temp_ECG1<5);
t_5sec2=temp_ECG2.*(temp_ECG2<5);




figure ;

subplot(2, 1, 1); 
plot(temp_ECG1,A2_ECG1 );
title('ECG 1 ');
xlabel('time in full time');
ylabel('A');


subplot(2, 1, 2); 
plot(t_5sec1, A2_ECG1 , '-r');
title('ECG 1');
xlabel('time of first 5 secons');
ylabel('A');

%%%%%%%%%%%%%%%%%%%
figure ;

subplot(2, 1, 1);  
plot(temp_ECG1,A_ECG1 );
title('ECG 1 minus amp ');
xlabel('time in full time');
ylabel('A');


subplot(2, 1, 2);
plot(t_5sec1, A_ECG1 , '-r');
title('ECG 1 minus amp');
xlabel('time of first 5 secons');
ylabel('A');


%%%%%%%%%%%%
figure;

subplot(2, 1, 1); 
plot(temp_ECG2,A2_ECG2 );
title('ECG 2 minus  amp');
xlabel('time in full time');
ylabel('A');


subplot(2, 1, 2);  
plot(t_5sec2, A2_ECG2 , '-r');
title('ECG 2 minus amp');
xlabel('time of first 5 secons');
ylabel('A');

%%%%%%%%%%%%%%%%%%%
figure ;

subplot(2, 1, 1);  
plot(temp_ECG2,A2_ECG2 );
title('ECG 2 ');
xlabel('time in full time');
ylabel('A');


subplot(2, 1, 2); 
plot(t_5sec2, A2_ECG2 , '-r');
title('ECG 2');
xlabel('time of first 5 secons');
ylabel('A');


% Define the length of the signals
N1 = length(A2_ECG1);
N2 = length(A2_ECG2);

% Initialize the filtered signals
HP1 = zeros(N1, 1);
HP2 = zeros(N2, 1);
LP1 = zeros(N1, 1);
LP2 = zeros(N2, 1);

% Apply the high-pass filter to ECG1
for n = 33:N1
    HP1(n) = HP1(n-1) - (1/32)*A2_ECG1(n) + A2_ECG1(n-16) - A2_ECG1(n-17) + (1/32)*A2_ECG1(n-32);
end

% Apply the high-pass filter to ECG2
for n = 33:N2
    HP2(n) = HP2(n-1) - (1/32)*A2_ECG2(n) + A2_ECG2(n-16) - A2_ECG2(n-17) + (1/32)*A2_ECG2(n-32);
end

% Apply the low-pass filter to ECG1
for n = 13:N1
    LP1(n) = 2*LP1(n-1) - LP1(n-2) + A2_ECG1(n) - 2*A2_ECG1(n-6) + A2_ECG1(n-12);
end

% Apply the low-pass filter to ECG2
for n = 13:N2
    LP2(n) = 2*LP2(n-1) - LP2(n-2) + A2_ECG2(n) - 2*A2_ECG2(n-6) + A2_ECG2(n-12);
end

% Plotting the filtered signals
% Plot ECG 1 High-Pass Filter
figure;

subplot(2, 1, 1);
plot(temp_ECG1, A2_ECG1);
title('ECG 1 Original');
xlabel('Time in full time');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(temp_ECG1, HP1, '-r');
title('ECG 1 High-Pass Filtered');
xlabel('Time in full time');
ylabel('Amplitude');

% Plot ECG 1 Low-Pass Filter
figure;

subplot(2, 1, 1);
plot(temp_ECG1, A2_ECG1);
title('ECG 1 Original');
xlabel('Time in full time');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(temp_ECG1, LP1, '-r');
title('ECG 1 Low-Pass Filtered');
xlabel('Time in full time');
ylabel('Amplitude');

% Plot ECG 2 High-Pass Filter
figure;

subplot(2, 1, 1);
plot(temp_ECG2, A2_ECG2);
title('ECG 2 Original');
xlabel('Time in full time');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(temp_ECG2, HP2, '-r');
title('ECG 2 High-Pass Filtered');
xlabel('Time in full time');
ylabel('Amplitude');

% Plot ECG 2 Low-Pass Filter
figure;

subplot(2, 1, 1);
plot(temp_ECG2, A2_ECG2);
title('ECG 2 Original');
xlabel('Time in full time');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(temp_ECG2, LP2, '-r');
title('ECG 2 Low-Pass Filtered');
xlabel('Time in full time');
ylabel('Amplitude');