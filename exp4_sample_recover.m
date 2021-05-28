clear all;
t=-0.4:0.0002:0.4;

N_fft=length(t);
dT=0.0002;
df=1/(dT*N_fft);
F=df*((1:N_fft)-N_fft/2);

% Defines the frequency of sampling, and then the corresponding other parameters
fs=200;
ts=1/fs;
nt=-0.4:ts:0.4;


fc=50;%Filter value

%Draw the original signal first
t=-0.4:0.0002:0.4;
x1=zeros(size(t));
x2=zeros(size(t));
x=zeros(size(t));
x1=0.02*(1+0.4*cos(60*pi*t));
x2=0.0001+t.^2;
x=x1./x2;
plot(t,x);
title({'HFUT Signal&System2021 Exp-4.1';'origin signal'},'FontSize',20);

%Spectrogram
figure(2);
A=fftshift(fft(x));
y=abs(A);
plot(F,y);
title({'HFUT Signal&System2021 Exp-4.2';'frequency-amplitude'},'FontSize',20);
xlabel('frequency');
ylabel('amplitude');

%Sampling to draw stem stick diagram (time domain sampling)
figure(3);
xs=0.02*(1+0.4*cos(60*pi*nt))./(nt.*nt+0.0001);
stem(xs);
title({'HFUT Signal&System2021 Exp-4.3';'STEM'},'FontSize',20);

%Use misplaced addition to simulate the effect of frequency domain sampling
figure(4);
Rshift=floor(fs/df);%Because crishift is an array operation and can only take integer values, division is not necessarily an integer result, so round down

for k=-4:4
   A=A+circshift(A,[0 k*Rshift]);
end
y=abs(A);
plot(F,y);
title({'HFUT Signal&System2021 Exp-4.4';'Cuo Wei Xiang Jia'},'FontSize',20);
xlabel('frequency');
ylabel('amplitude');

%Filter
figure(5);
H=(abs(F)<fc);%Low-pass filter, for array elements whose F is less than fc, directly take the value 0
As=H.*A;
plot(F,abs(As));
title({'HFUT Signal&System2021 Exp-4.5';'Low Pass Filter'},'FontSize',20);
xlabel('frequency');
ylabel('amplitude');

%Restore the signal after frequency domain sampling
figure(6);
ys=ifft(ifftshift(As));
plot(t,ys);
title({'HFUT Signal&System2021 Exp-4.6';'recovery after sampling and LowPassFilter'},'FontSize',20);
xlabel('time');
ylabel('value');