clc;
clear all;
close all;
%step 1-: msg signal load
bitstream=load('inout.txt')

%step 2-basic Parameters

fc=input('input fc:');
tb=1;% bit duration
fs=100;
t=0:1/fs:tb-(1/fs)
a=5;
%implementation
ASK=[];
PSK=[];
FSK=[];

for i=1:length(bitstream)
  if bitstream(i)==1
      ask=2*a*cos(2*pi*fc*t);
      psk=a*cos(2*pi*fc*t);
      fsk=a*cos(2*pi*3*fc*t);
  else
      ask=(0.5)*a*cos(2*pi*fc*t);
      psk=a*cos(2*pi*fc*t+pi);
      fsk=a*cos(2*pi*(0.5)*fc*t);
    end
    ASK=[ASK ask];
    PSK=[PSK psk];
    FSK=[FSK fsk];

end


subplot(3,1,1)

plot(ASK, 'pr', 'MarkerSize', 5);
title('ASK');
grid on;
subplot(3,1,2)
plot(PSK,'r');
title('PSK');
grid on;
subplot(3,1,3)
plot(FSK,'g');
title('FSK');
grid on;



