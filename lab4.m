close all;
clc ;
clear all;

fm=100;
fs=10000;
t=0:1/fs:1000/fs;

%message signal
x=5*sin(2*pi*fm.*t);
plot(t,x );
hold on;
%sampling
y=[0];
xr=0;
del=0.4;
for i=1:length(x)-1
   if xr(i)<=x(i)
     d=1;
     xr(i+1)=xr(i)+del;
   else
     d=0;
     xr(i+1)=xr(i)-del;
   end
   y=[y d];
 end

 stairs(t,xr);% shoew statre
 title('staircase  Approximated Signal');
 hold off;

 mse=sum((x-xr).^2)/length(x);%mean square error
 disp(['Mean squared error(mse):',num2str(mse)]);
 figure;

 subplot(3,1,1);
 plot(t,y);
 title('Delta Modulated signal');


 %demodukated signal
 subplot(3,1,2);
 y_demod=[0];
 x_demod=0;
 for i=2:length(y)
   if y(i)==1
     x_demod=x_demod+del;
   else
      x_demod=x_demod-del;
   end
   y_demod=[y_demod x_demod];
 end
 plot(t,y_demod);
 title('delta demodulated signal before filtering');

 %apply low pass filter

 filterorder=20;
 lopas=fir1(filterorder,fm/(fs/2),'low');
 rectss=filter(lopas,1,y_demod);

 subplot(3,1,3);
 plot(t,rectss);
 title('filtered demodulation signal');


