clear all;
t=-2:0.01:4;
m=-4:0.01:8;
%Convolve f1 and f2 with the convolution function, and the output result in f3
f1=zeros(size(t));
f2=zeros(size(t));
f3=zeros(size(t));
f1=(-2)*(us(t-0.5)-us(t-2));
f2=(2*t+2).*(us(t+1)-us(t-2));
f3=0.01*conv(f1,f2);
plot(m,f3);
axis([-6,6,-16,16]);
hold on;
plot(t,f1);
axis manual;
hold on;
plot(t,f2);
legend('f3','f1','f2');
title({'HFUT Signal&System2021 Exp-2';'Juan Ji'},'FontSize',24);
%draw in one figure


%The second figure is to draw the two original functions and the convolution result separately, and draw three pictures
figure(2);
subplot(3,1,1);
axis manual;
plot(t,f1);
title('t-f1','FontSize',20);
subplot(3,1,2);
plot(t,f2);
title('t-f2','FontSize',20);
subplot(3,1,3);
plot(m,f3);
title('m-f3','FontSize',20);
