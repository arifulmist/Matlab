pkg load signal;
clear all;
clc;

%time parameter
samling_frequnecy=1000;
TimeAxis=linspace(0,1,1000);

%baseband message
frequency= 10;
Amplitude=1;
message_signal= Amplitude.*sin(2*pi*frequency.*TimeAxis);

%carrier signal
carrier_frequency=100;
Amplitude_carrier=2;
carrier_signal= Amplitude_carrier.*sin(2*pi*carrier_frequency.*TimeAxis);

%frequncy deviation constant for Frequnecy modulation
kf=25;

%Signal After Frequency Modulation.
Modulated_signal=Amplitude_carrier*sin(2*pi*carrier_frequency.*TimeAxis+kf*message_signal);

%demodulation
%Differentiate the modulated signal
demodulated_signal=[diff(Modulated_signal) 0]*samling_frequnecy;

%rectify the demoduled signal for better visibility in filtering
rectifed_signal= abs(demodulated_signal);

%low pass filter
cutoff_freq=20;

%FIR filter
numtaps=20; %the more it increase the more it will be sharper
normalized_cuttoff_freq=cutoff_freq/(samling_frequnecy/2); %normilze cutoff frequency
fir_coeff =fir1(numtaps-1,normalized_cuttoff_freq,'low');

%apply the fir filter to rectified signal
filtered_signal =filter(fir_coeff,1,rectifed_signal); %a is simply 1

%Ploting the graph

%message signal
subplot(2,2,1);
plot(TimeAxis,message_signal,'b');
title('Message Signal');
legend('Message');
xlabel('Time');
ylabel('Amplitude');
grid on;

%carrier signal
%subplot(3,2,2);
%plot(TimeAxis,carrier_signal,'g');
%legend('carrier');
%title('carrier signal');
%xlabel('Time');
%ylabel('Amplitude');
%grid on;

%Modulated signal
subplot(2,2,2);
plot(TimeAxis,Modulated_signal,'r');
title('Frequency Modulation');
legend('signal');
xlabel('Time');
ylabel('Amplitude');
grid on;

%rectifed signal
subplot(2,2,3);
plot(TimeAxis,rectifed_signal,'r');
title('Frequency Modulation');
legend('signal');
xlabel('Time');
ylabel('Amplitude');
grid on;


%Filtered signal
subplot(2,2,4);
plot(TimeAxis,filtered_signal,'r');
title('Frequency Modulation');
legend('signal');
xlabel('Time');
ylabel('Amplitude');
grid on;



