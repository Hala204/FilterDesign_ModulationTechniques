% Parameters
fs = 100000; % Sampling frequency (increased for better resolution)
t = 0:1/fs:5/200; % Time vector

% Message signal
M = sin(2*pi*200*t);
figure;
subplot(3,1,1);
plot(t, M);
title('Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Carrier signal
C_S = cos(2*pi*1000*t);

% Modulated signal (DSB-SC)
M_S = M .* C_S;
subplot(3,1,2);
plot(t, M_S);
title('DSB-SC Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Coherent demodulation
R_S = M_S .* cos(2*pi*1000*t);
% Low-pass filter to recover the message signal
M_R = lowpass(R_S, 200, fs);
subplot(3,1,3);
plot(t, R_S);
title('Recovered Message Signal After Low-pass Filter');
xlabel('Time (s)');
ylabel('Amplitude');
