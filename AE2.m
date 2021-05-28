clear all;
t=-0.4:0.0002:0.4;
N_fft=length(t);
dT=0.0002;
df=1/(dT*N_fft);
F=df*((1:N_fft)-N_fft/2);

fs=200;%Sampling frequency
ts=1/fs;
nt=-0.4:ts:0.4;
N_ffts=length(nt);
dTs=0.005;
dfs=1/(dTs*N_ffts);
Fs=dfs*((1:N_ffts)-N_ffts/2);

fc=50;%Low-pass filter filtering

% Directly use a single rectangular pulse signal
% So, no time domain sampling

width=5*dT
x1=zeros(size(t));
x1=rectpuls(t,width);
x2=zeros(size(t));
x2=rectpuls(t,(2*width));
%Draw the value of the original function
figure(1);
subplot(3,1,1);
plot(t,x1);
subplot(3,1,2);
plot(t,x2);
x=x1+x2;
subplot(3,1,3);
plot(t,x);


%Spectrum, it can be seen that it is a Sa signal
figure(2);
A1=fftshift(fft(x1));
A2=fftshift(fft(x2));
A=fftshift(fft(x));
subplot(3,1,1);
plot(F,abs(A1));
subplot(3,1,2);
plot(F,abs(A2));
subplot(3,1,3);
plot(F,abs(A));


%Start misplaced addition
figure(3);
Rshift=floor(fs/df);
for k=-4:4
   A1=A1+circshift(A1,[0 k*Rshift]);
   A2=A2+circshift(A2,[0 k*Rshift]);
   A=A+circshift(A,[0 k*Rshift]);
end
y1=abs(A1);
y2=abs(A2);
y=abs(A);
subplot(3,1,1);
plot(F,y1);
subplot(3,1,2);
plot(F,y2);
subplot(3,1,3);
plot(F,y);
xlabel('frequency');
ylabel('amplitude');

%Filter
figure(4);
H=(abs(F)<fc);
A1c=H.*A1;
A2c=H.*A2;
Ac=H.*A
subplot(3,1,1);
plot(F,A1c);
subplot(3,1,2);
plot(F,A2c);
subplot(3,1,3);
plot(F,Ac);

% Restore the sampled signal
%Restore the signal after frequency domain sampling
figure(5);
y1s=ifft(ifftshift(A1c));
y2s=ifft(ifftshift(A2c));
ys=ifft(ifftshift(Ac));
subplot(3,1,1);
plot(t,y1s);
subplot(3,1,2);
plot(t,y2s);
subplot(3,1,3);
plot(t,ys);