pkg load signal;
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

cutoff=20;
num=20;
normalized_cut=cutoff/(fs/2);
fir=fir1(num-1,normalized_cut,'low');
filt=filter(fir,1,re);% butter filtter






figure;
subplot(2,1,1);
plot(t,re);
title("rectefied signal");
xlabel("Time(s)");
ylabel("Amplituute");
grid on;

subplot(2,1,2);
plot(t,filt);
title("filter signal");
xlabel("Time(s)");
ylabel("Amplituute");
grid on;


