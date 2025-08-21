clear all;
clc;
fs=1000;
t=linspace(0,1,1000);
fm=10;
am=1;
msg=am*sin(2*pi*fm.*t);

fc=100;
ac=2;
car=ac*sin(2*pi*fc.*t);
kf=25;
ms=ac*sin(2*pi*fc.*t+kf*msg);%modulated singnal



ds=[diff(ms) 0]*fs;%demodulated siignal

rs=abs(ds);%rectified signal


figure;
subplot(3,1,1);
plot(t,msg);
title("massage signal");
xlabel("Time(s)");
ylabel("Amplituute");
grid on;

subplot(3,1,2);
plot(t,car);
title(" carried signal");
xlabel("Time(s)");
ylabel("Amplituute");
grid on;

subplot(3,1,3);
plot(t,ms);
title("Modulated signal");
xlabel("Time(s)");
ylabel("Amplituute");
grid on;



figure;
subplot(2,1,1);
plot(t,ds);
title(" demodulated signal");
xlabel("Time(s)");
ylabel("Amplituute");
grid on;

subplot(2,1,2);
plot(t,rs);
title("Rectified signal");
xlabel("Time(s)");
ylabel("Amplituute");
grid on;


