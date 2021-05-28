clear all;

%First draw the graph of the original function
figure(1);
t=-1.5:0.001:1.5;
rectwave=zeros(size(t));
rectwave = ur(t+0.5)+9*ur(t+0.1)-20*ur(t)+9*ur(t-0.)+ur(t-0.5);
plot(t,rectwave);
title({'HFUT Signal&System2021 Exp-3.1';'time-value'},'FontSize',16);
xlabel('time','FontSize',16);
ylabel('value','FontSize',16);
hold on;

%Next is the drawing of amplitude spectrum and phase spectrum
figure(2);
RW=fft(rectwave);
N_fft=length(t);
dT=0.001;
df=1/(dT*N_fft);
Faxis=df*((1:N_fft)-N_fft/2);
%In order to draw the frequency spectrum, a frequency abscissa is needed, which is Faxis. Then expand the array after the fast Fourier transform (fft) to the F axis


%First is the amplitude spectrum
RW0=fftshift(RW);
RWA=abs(RW0);
subplot(2,1,1);
plot(Faxis,RWA);
title({'HFUT Signal&System2021 Exp-3.2';'F¨² D¨´ P¨³ & Xi¨¤ng W¨¨i P¨³'},'FontSize',16);
xlabel('frequency','FontSize',16);
ylabel('amplitude','FontSize',16);
hold on;
%Phase spectrum (call the angle function directly to solve the angle)
Phase=angle(RW)/pi*180;
subplot(2,1,2);
plot(Faxis,Phase);
xlabel('frequency','FontSize',16);
ylabel('phase(¦Ð)','FontSize',16);
hold on;

%Then introduce phase shift
figure(3);
PS=64;
Pshift = 0.1*(PS-50)*Faxis;
RWchange=RW0.*exp(j*Pshift);%Phase shift is introduced here, the following is the inverse transformation process
ReRW0=ifft(ifftshift(RWchange));
ReRW=ifft(RWchange);%End of inverse transformation, start drawing figure
plot(t,ReRW0);
hold on;
plot(t,ReRW);
hold on;
plot(t,rectwave);
hold on;
legend('using ifftshift','using ifft','origin signal');
title({'HFUT Signal&System2021 Exp-3.3';'change phase & recover'},'FontSize',18);
%The result is, using the fftshift graphics is equivalent to converting the phase shift into a time domain translation
%But if you don¡¯t use 'shift' to adjust the order of the array, due to the definition of the functions, the array whose order has been changed will be directly used for operation, and the result will be a messy image

%Finally, the pulse signal part
figure(4);
for k=1:5 	%Becomes a 5-pulse signal
    	rectwave5((k-1)*N_fft+1:k*N_fft) = rectwave;
end
RW5_0=fftshift(fft(rectwave5));
RW5_A=abs(RW5_0);
plot(RWA);
hold on;
plot(RW5_A);
legend('5-Pulsed signal','origin signal')
title({'HFUT Signal&System2021 Exp-3.4';'Pulsed Signal & origin signal';},'FontSize',18);
xlabel('frequency','FontSize',16);
ylabel('amplitude','FontSize',16);

figure(5);
for k=1:11 	%Becomes a 11-pulse signal
    	rectwave11((k-1)*N_fft+1:k*N_fft) = rectwave;
end
RW11_0=fftshift(fft(rectwave11));
RW11_A=abs(RW11_0);

for k=1:101 	%Becomes a 101-pulse signal
    	rectwave101((k-1)*N_fft+1:k*N_fft) = rectwave;
end
RW101_0=fftshift(fft(rectwave101));
RW101_A=abs(RW101_0);

%Draw a graph of the three pulses, and then add some coordinate axis icons
subplot(3,1,1);
plot(RW5_A);
xlabel('frequency','FontSize',16);
ylabel('amplitude','FontSize',16);
title({'HFUT Signal&System2021 Exp-3.4.2';'different pulse series';'k=5'},'FontSize',18);
subplot(3,1,2);
plot(RW11_A);
xlabel('frequency','FontSize',16);
ylabel('amplitude','FontSize',16);
title('k=11','FontSize',18)
subplot(3,1,3);
plot(RW101_A);
xlabel('frequency','FontSize',16);
ylabel('amplitude','FontSize',16);
title('k=101','FontSize',18);