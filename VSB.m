% Define the time vector
t = -1/5:1/(1000*5):1;

% Message signal
M = 2 * sinc(10*pi*t);
figure;
subplot(3,1,1);
plot(t, M);
title('Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Carrier signal
C = cos(2*pi*1000*t);

% Modulated signal (DSB-SC)
x = M .* C;

% Define the sampling frequency
fs = 1000 * 5;

% Apply bandpass filtering to create the VSB signal
s = bandpass(x, [1000-5*pi, 1000+10*pi], fs);
subplot(3,1,2);
plot(t, s);
title('VSB Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Coherent demodulation
S_R = s .* C;

% Low-pass filter to recover the message signal
M_R = lowpass(S_R, 10*pi, fs);
subplot(3,1,3);
plot(t, M_R);
title('Recovered Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');
