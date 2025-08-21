pkg load signal;
clear all;
clc;

fs = 1000;
t = linspace(0, 1, fs);

% Message signal
fm = 10;
am = 1;
x1 = am * sin(2 * pi * fm .* t);

% Carrier signal
fc = 100;
ac = 2;
x2 = ac * sin(2 * pi * fc .* t);

% Modulated signal (AM)
ms = (1 + x1) .* x2;

% Envelope detection using rectification
re = abs(ms);

% Low-pass filter design
cutoff = 20;
num = 20;
normalized_cut = cutoff / (fs / 2);
fir = fir1(num - 1, normalized_cut, 'low');

% Apply filter to rectified signal
filt = filter(fir, 1, re);

% Plotting
figure;
subplot(2,1,1);
plot(t, re);
title("Rectified Signal");
xlabel("Time (s)");
ylabel("Amplitude");
grid on;

subplot(2,1,2);
plot(t, filt);
title("Filtered Signal (Envelope)");
xlabel("Time (s)");
ylabel("Amplitude");
grid on;

