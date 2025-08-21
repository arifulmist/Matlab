clear all;
clc;
fs=1000;
t=linspace(0,1,fs);
%message singla
fm=10;
am=1;
x1=am*sin(2*pi*fm.*t);

%collector message
fc=100;
ac=2;
x2=ac*sin(2*pi*fc.*t);

ms=(1+x1).*x2;
re=abs(ms);

figure;
subplot(2,1,1);
plot(t,ms);
title("modulated signal");
xlabel("Time(s)");
ylabel("Amplituute");
grid on;

subplot(2,1,2);
plot(t,re);
title("rectified signal");
xlabel("Time(s)");
ylabel("Amplituute");
grid on;


