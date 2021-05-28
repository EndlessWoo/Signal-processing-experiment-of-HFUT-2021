clear all;
t=-0.5:0.001:7;
%The following are the first three figures of the first experiment, demonstrating the synthesis when k is equal to different values
%figure1
rectwave=zeros(size(t));
 for k=0:100
   rectwave=rectwave+sin((2*k+1)*t)/(2*k+1);
  end;
rectwave=0.5+(2/pi)*rectwave;%The previous calculations only count the cumulative part, without the coefficient, here finally take 2/¦° and add 1/2, which can simplify the calculation
subplot(3,1,1);
plot(t,rectwave);
title({'HFUT Signal&System2021 Exp-1.1';'k=100'},'FontSize',16);
%figure2
rectwave=zeros(size(t));
for k=0:20
   rectwave=rectwave+sin((2*k+1)*t)/(2*k+1);
  end;
rectwave=0.5+(2/pi)*rectwave;
  subplot(3,1,2);
plot(t,rectwave);
title('k=20','FontSize',16);
%figure3
rectwave=zeros(size(t));
for k=0:3
   rectwave=rectwave+sin((2*k+1)*t)/(2*k+1);
  end;
rectwave=0.5+(2/pi)*rectwave;
subplot(3,1,3);
plot(t,rectwave);
title('k=3','FontSize',16);

%Begin to draw figure4&5 of the first experiment to demonstrate the situation when all elements are halved or only the third harmonic is halved
figure(2);
%figure4£¬All elements become halved
rectwave=zeros(size(t));
for k=0:500
   rectwave=rectwave+0.5*sin((2*k+1)*t)/(2*k+1);
  end;
rectwave=0.5+(2/pi)*rectwave;
subplot(2,1,1);
plot(t,rectwave);
title({'HFUT Signal&System2021 Exp-1.2';'k=500,HalfSized All'},'FontSize',24);
%figure5£¬Only the third harmonic is halved
rectwave=zeros(size(t));
rectwave=0.5*sin(3*t)/3
for k=1:500
   rectwave=rectwave+sin((2*k+1)*t)/(2*k+1);
  end;
rectwave=0.5+(2/pi)*rectwave;
subplot(2,1,2);
plot(t,rectwave);
title('k=500,Only HalfSized in k=1','FontSize',24);

%Begin to draw figure6&7 of the first experiment,Demonstrates the scenario of full phase shift and only the third harmonic phase shift
figure(3);
%figure6£¬Phase shift all
rectwave=zeros(size(t));
for k=0:500
   rectwave=rectwave+sin((2*k+1)*t+(2*k+1)*pi/3)/(2*k+1);
  end;
rectwave=0.5+(2/pi)*rectwave;
subplot(2,1,1);
plot(t,rectwave);
title({'HFUT Signal&System2021 Exp-1.3';'k=500,Phase Shift All'},'FontSize',24);
%figure7£¬Phase shift only the third harmonic
rectwave=zeros(size(t));
rectwave=sin(3*t+pi)/3
for k=1:500
   rectwave=rectwave+sin((2*k+1)*t)/(2*k+1);
  end;
rectwave=0.5+(2/pi)*rectwave;
subplot(2,1,2);
plot(t,rectwave);
title('k=500,Only Phase Shift in k=1','FontSize',24);

%The following are the last figure of the first experiment, demonstrating the change of the waveform when it passes through the RC filters
%Different RC values represent different filters
figure(4);
clear all;
t=-0.5:0.001:7;
rc=0.1;
rectRC1=zeros(size(t));
for k=0:500
    b=2*k+1
    rectRC1=rectRC1+(sin(t*b-atan(rc*b))/sqrt(1+(rc*b)^2))/b;
end
rectRC1=0.5+(2/pi)*rectRC1;

rc=0.3;
rectRC2=zeros(size(t));
for k=0:500
    b=2*k+1
    rectRC2=rectRC2+(sin(t*b-atan(rc*b))/sqrt(1+(rc*b)^2))/b;
end
rectRC2=0.5+(2/pi)*rectRC2;

rc=1;
rectRC3=zeros(size(t));
for k=0:500
    b=2*k+1
    rectRC3=rectRC3+(sin(t*b-atan(rc*b))/sqrt(1+(rc*b)^2))/b;
end
rectRC3=0.5+(2/pi)*rectRC3;

rc=3;
rectRC4=zeros(size(t));
for k=0:500
    b=2*k+1
    rectRC4=rectRC4+(sin(t*b-atan(rc*b))/sqrt(1+(rc*b)^2))/b;
end
rectRC4=0.5+(2/pi)*rectRC4;

plot(t,rectRC1);
hold on;
plot(t,rectRC2);
hold on;
plot(t,rectRC3);
hold on;
plot(t,rectRC4);
hold on;
legend('rc=0.1','rc=0.3','rc=1','rc=3');
title({'HFUT Signal&System2021 Exp-1.4';'RC filter'},'FontSize',24);
