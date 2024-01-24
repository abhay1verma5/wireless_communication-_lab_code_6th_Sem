%  Institute: Indian Institute of Information Technology Nagpur
%  Laboratory: Wireless Communication
%  Engineer: Ar 
%  Create Date: 22.01.2024 16:41:17
%  Project Name: Sampling and Quantization of given signal 
%  Tool: Matlab
%  Description: 
  

clc
clear all
close all
%take input of sampling frquancy
fs = input('enter sampling frequancy-');
%take input of signal frequancy
f1 = input('enter signal frequancy-');
%define time
t = 0:1/fs:1;
%define signal
x = 2*sin(2*pi*f1*t)+5*cos(2*pi*f1*t);
%plot original signal
subplot(2,2,1)
plot(t,x)
xlabel('\bf time');
ylabel('\bf Amlitude');
title('continuous original signal');
%plot discrete version of original signal
subplot(2,2,2)
stem(t,x)
xlabel('\bf time');
ylabel('\bf Amlitude');
title('discrete original signal');
%extract time for sampling purpose
t1 = t(1:2:end);
%define signal for sampling
x1 = 2*sin(2*pi*f1*t1)+5*cos(2*pi*f1*t1);
% plot sample signal with less number of sample
subplot(2,2,3)
plot(t1,x1)
xlabel('\bf time');
ylabel('\bf Amlitude');
title('continuous sampled signal');
%plot discrete version of sampled signal
subplot(2,2,4)
stem(t1, x1)
xlabel('\bf time');
ylabel('\bf Amlitude');
title('discrete sampled signal');
%extreme value of signal
x_max = max(x1);
x_min = min(x1);
xquan=x1/x_max;
%number of quantization level
n=16;

%step size for accomdate n quantization level
d = (x_max-x_min)/n;

%store value of level for quantiz purpose
 q = (x_min:d:x_max);
 for ii=1:n
    q1(ii)=(q(ii)+q(ii+1))/2;
 end


%here we are quantised our signal and also change into in decimal value
for jj=1:n
    xquan(find((q1(jj)-d/2<=x)&(x<=q1(jj)+d/2))) = q1(jj).*ones(1,length(find((q1(jj)-d/2<=x)&(x<=q1(jj)+d/2))));
    deci(find(xquan==q1(jj)))=(jj-1).*ones(1,length(find(xquan==q1(jj))));
end


%plot quantised signal 
figure(2);
plot(t,xquan);
xlabel('Time');
ylabel('Amplitude');
title('Quantised Signal');

%change decimal value of level into binary numbers 
%or encoded string
bina = cell(size(deci));
for kk=1:length(deci)
    bina{kk}=flip(de2bi(deci(kk), 4));
end