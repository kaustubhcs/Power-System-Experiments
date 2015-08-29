% Phase Modulatioon
clear all;
clc;

Ac = 10;
fc = 200;
fm = 10;
beta = 10;
Am = 10;

t = [0 : 0.001 : 1];


for i = 1:1001
    output(i) = Ac * cos (2 * pi * fc * t(i) + beta * sin(2 * pi * fm * t(i)));
    input(i) = Am * cos (2* pi * fm * t(i));
end

size(t)
size(output)
size(input)
%figure('Phase Modulation');
%plot (t,output);
subplot(3,1,1);
plot(t,output,t,input);
subplot(3,1,2);
plot(t,input);


% Demodulation

fs = 2*fc + 10;

x = demod(output,fc,fs,'fm');
subplot(3,1,3);
plot(t,x);
