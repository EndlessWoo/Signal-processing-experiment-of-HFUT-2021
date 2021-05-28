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

fc=50;%Low pass filter filter value

x1=zeros(size(t));
x1=cos(30*pi*t);
x2=zeros(size(t));
x2=cos(60*pi*t);
%Draw the value of the original function
figure(1);
subplot(3,1,1);
plot(t,x1);
subplot(3,1,2);
plot(t,x2);
x=x1+x2;
subplot(3,1,3);
plot(t,x);


%Spectrogram
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

%Time domain sampling
figure(3);
x1s=cos(30*pi*nt);
x2s=cos(60*pi*nt);
xs=x1s+x2s;
subplot(3,1,1);
stem(x1s);
subplot(3,1,2);
stem(x2s);
subplot(3,1,3);
stem(xs);

%Time-domain sampled frequency spectrum
figure(4);
A1s=fftshift(fft(x1s));
A2s=fftshift(fft(x2s));
As=fftshift(fft(xs));
subplot(3,1,1);
plot(Fs,abs(A1s));
subplot(3,1,2);
plot(Fs,abs(A2s));
subplot(3,1,3);
plot(Fs,abs(As));

%Inverse spectrum transform
figure(5);
x1r=ifft(ifftshift(A1s));
x2r=ifft(ifftshift(A2s));
xr=ifft(ifftshift(As));
subplot(3,1,1);
plot(nt,x1r);
subplot(3,1,2);
plot(nt,x2r);
subplot(3,1,3);
plot(nt,xr);

%Start misplaced addition
figure(6);
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
figure(7);
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
% Signal passes through the filter 
figure(8);
y1s=ifft(ifftshift(A1c));
y2s=ifft(ifftshift(A2c));
ys=ifft(ifftshift(Ac));
subplot(3,1,1);
plot(t,y1s);
subplot(3,1,2);
plot(t,y2s);
subplot(3,1,3);
plot(t,ys);

% Restore the sampled signal
%Restore the signal after frequency domain sampling
% The signal does not pass the filter. At this time, it can be seen that the continuous frequency domain signal corresponds to the discrete time domain signal.
figure(9);
y1s=ifft(ifftshift(A1));
y2s=ifft(ifftshift(A2));
ys=ifft(ifftshift(A));
subplot(3,1,1);
plot(t,y1s);
subplot(3,1,2);
plot(t,y2s);
subplot(3,1,3);
plot(t,ys);