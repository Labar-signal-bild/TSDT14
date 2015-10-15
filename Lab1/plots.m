%% Plots

figure(1);
subplot(2,1,1)
plot(theta, Ry1);
axis([0 1 0 0.55])
title('PSD');
xlabel('\theta');

subplot(2,1,2)
stem(n, ry1);
axis([-40 40 0 0.07])
title('ACF');
xlabel('n');
 
figure(2)
subplot(2,1,1)
plot(theta,Ry2);
axis([0 1 -0.01 0.55])
title('PSD');
xlabel('\theta');

subplot(2,1,2)
stem(n, ry2);
axis([-40 40 -0.04 0.1])
title('ACF');
xlabel('n');


%%

% ACF H mot L

figure(3)
subplot(2,1,1);
stem(kVectorL,ACF1L);
axis([min(kVectorL) max(kVectorL) -ACFMax1L*0.5 ACFMax1L*1.5])
title('ACF |k|<20');
xlabel('k');

subplot(2,1,2)
plot(kVectorH,ACF1H);
axis([min(kVectorH) max(kVectorH) -ACFMax1H*0.3 ACFMax1H*1.5])
title('ACF |k|<10^4');
xlabel('k');

figure(4)
subplot(2,1,1);
stem(kVectorL,ACF2L);
axis([min(kVectorL) max(kVectorL) -ACFMax2L*0.5 ACFMax2L*1.5])
title('ACF |k|<20');
xlabel('k');

subplot(2,1,2)
plot(kVectorH,ACF2H);
axis([min(kVectorH) max(kVectorH) -ACFMax2H*0.3 ACFMax2H*1.5])
title('ACF |k|<10^4');
xlabel('k');

%% PSD H & L

figure(5)
subplot(2,1,1);
plot(thetaVectorL,abs(PSD1L));
axis([min(thetaVectorL) max(thetaVectorL) 0 PSDMax1L*1.5])
title('PSD |k|<20');
xlabel('\theta');

subplot(2,1,2);
plot(thetaVectorH,abs(PSD1H));
axis([min(thetaVectorH) max(thetaVectorH) 0 PSDMax1H*1.5])
title('PSD |k|<10^4');
xlabel('\theta');

figure(6)
subplot(2,1,1);
plot(thetaVectorL,abs(PSD2L));
axis([min(thetaVectorL) max(thetaVectorL) 0 PSDMax2L*1.5])
title('PSD |k|<20');
xlabel('\theta');

subplot(2,1,2);
plot(thetaVectorH,abs(PSD2H));
axis([min(thetaVectorH) max(thetaVectorH) 0 PSDMax2H*1.5])
title('PSD |k|<10^4');
xlabel('\theta');

%% Blackman plots

ACFMax1=max(ACF1Bla);
ACFMax2=max(ACF2Bla);
PSDMax1=max(abs(PSD1Bla));
PSDMax2=max(abs(PSD2Bla));


figure(7)
subplot(2,1,1)
plot(kVectorH,ACF1Bla);
axis([min(kVectorH) max(kVectorH) -ACFMax1*1.5 ACFMax1*1.5])
title('ACF');
xlabel('k');


subplot(2,1,2)
plot(thetaVectorH,abs(PSD1Bla));
axis([min(thetaVectorH) max(thetaVectorH) -PSDMax1*1.5 PSDMax1*1.5])
title('PSD');
xlabel('\theta');


figure(8)
subplot(2,1,1)
plot(kVectorH,ACF2Bla);
axis([min(kVectorH) max(kVectorH) -ACFMax2*1.5 ACFMax2*1.5])
title('ACF');
xlabel('k');

subplot(2,1,2)
plot(thetaVectorH,abs(PSD2Bla));
axis([min(thetaVectorH) max(thetaVectorH) -PSDMax2*1.5 PSDMax2*1.5])
title('PSD');
xlabel('theta');



Smoothing(ACF2Bla,'plot');





%% 

%saveas(1,'Lab1fig1.svg');
%saveas(2,'Lab1fig2.svg');

%saveas(3,'Lab1fig3.svg');
%saveas(4,'Lab1fig4.svg');
%saveas(5,'Lab1fig5.svg');
%saveas(6,'Lab1fig6.svg');

%saveas(7,'Lab1fig7.svg');
%saveas(8,'Lab1fig8.svg');
%saveas(9,'Lab1fig9.svg');

%close all