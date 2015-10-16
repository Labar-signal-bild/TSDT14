%% Plots

figure(1);
subplot(2,1,1)
plot(thetaH, Ry1);
axis([0 1 0 0.55])
title('PSD');
xlabel('\theta');

subplot(2,1,2)
stem(n, ry1);
axis([-40 40 0 0.07])
title('ACF');
xlabel('k');
 
figure(2)
subplot(2,1,1)
plot(thetaH,Ry2);
axis([0 1 0 0.55])
title('PSD');
xlabel('\theta');

subplot(2,1,2)
stem(n, ry2);
axis([-40 40 -0.04 0.1])
title('ACF');
xlabel('k');


%%

% ACF H mot L

figure(3)
subplot(2,1,1);
stem(kL,ACF1L);
axis([min(kL) max(kL) -ACFMax1L*0.6 ACFMax1L*1.1])
title('ACF |k|<20');
xlabel('k');

subplot(2,1,2)
plot(kH,ACF1H);
axis([min(kH) max(kH) -ACFMax1H*0.1 ACFMax1H*1.1])
title('ACF |k|<10^4');
xlabel('k');


figure(4)
subplot(2,1,1);
stem(kL,ACF2L);
axis([min(kL) max(kL) -ACFMax2L*0.5 ACFMax2L*1.1])
title('ACF |k|<20');
xlabel('k');

subplot(2,1,2)
plot(kH,ACF2H);
axis([min(kH) max(kH) -ACFMax2H*0.3 ACFMax2H*1.1])
title('ACF |k|<10^4');
xlabel('k');

%% PSD H & L

figure(5)

subplot(2,1,1);
plot(thetaL,abs(PSD1L));
axis([min(thetaL) max(thetaL) 0 0.6])
title('PSD |k|<20');
xlabel('\theta');

hold on
subplot(2,1,1);
plot(thetaH, Ry1H);
hold off

subplot(2,1,2);
plot(thetaH,abs(PSD1H));
axis([min(thetaH) max(thetaH) 0 PSDMax1H*1.1])
title('PSD |k|<10^4');
xlabel('\theta');

hold on
subplot(2,1,2);
plot(thetaH, Ry1H);
hold off


figure(6)
subplot(2,1,1);
plot(thetaL,abs(PSD2L));
axis([min(thetaL) max(thetaL) 0 0.6])
title('PSD |k|<20');
xlabel('\theta');

hold on
subplot(2,1,1);
plot(thetaH, Ry2H);
hold off

subplot(2,1,2);
plot(thetaH,abs(PSD2H));
axis([min(thetaH) max(thetaH) 0 PSDMax2H*1.1])
title('PSD |k|<10^4');
xlabel('\theta');

hold on
subplot(2,1,2);
plot(thetaH, Ry2H);
hold off

%% Averaged periods

figure(7)
subplot(2,1,1)
plot(thetaAv,abs(PSDAv1)); 
axis([0 1 0 PSDAv1Max1*1.5]); 
title('PSD'); 
xlabel('\theta');

hold on
subplot(2,1,1);
plot(thetaH, Ry1H);
hold off

subplot(2,1,2)
plot(kAv,abs(ACFAv1)); 
axis([min(kAv) max(kAv) -ACFAv1Max1*0.1 ACFAv1Max1*1.5]); 
title('ACF'); 
xlabel('k');


figure(8)
subplot(2,1,1)
plot(thetaAv,abs(PSDAv2));
axis([0 1 0 PSDAv2Max2*1.5]);
title('PSD');
xlabel('\theta');

hold on
subplot(2,1,1);
plot(thetaH, Ry2H);
hold off

subplot(2,1,2)
plot(kAv,abs(ACFAv2));
axis([min(kAv) max(kAv) -ACFAv2Max2*0.1 ACFAv2Max2*1.5]);
title('ACF');
xlabel('k');


%% Blackman plots

ACFMax1=max(ACF1Bla);
ACFMax2=max(ACF2Bla);
PSDMax1=max(abs(PSD1Bla));
PSDMax2=max(abs(PSD2Bla));


figure(9)
subplot(2,1,1)
plot(thetaH,abs(PSD1Bla));
axis([min(thetaH) max(thetaH) 0 PSDMax1*1.5])
title('PSD');
xlabel('\theta');

hold on
subplot(2,1,1);
plot(thetaH, Ry1H);
hold off

subplot(2,1,2)
plot(kH,ACF1Bla);
axis([min(kH) max(kH) -ACFMax1*0.1 ACFMax1*1.5])
title('ACF');
xlabel('k');




figure(10)
subplot(2,1,1)
plot(thetaH,abs(PSD2Bla));
axis([min(thetaH) max(thetaH) 0 PSDMax2*1.5])
title('PSD');
xlabel('\theta');

hold on
subplot(2,1,1);
plot(thetaH, Ry2H);
hold off

subplot(2,1,2)
plot(kH,ACF2Bla);
axis([min(kH) max(kH) -ACFMax2*0.1 ACFMax2*1.5])
title('ACF');
xlabel('k');

Smoothing(ACF2Bla,'plot');


%% 

saveas(1,'Lab1fig1.svg');
saveas(2,'Lab1fig2.svg');

saveas(3,'Lab1fig3.svg');
saveas(4,'Lab1fig4.svg');
saveas(5,'Lab1fig5.svg');
saveas(6,'Lab1fig6.svg');

saveas(7,'Lab1fig7.svg');
saveas(8,'Lab1fig8.svg');
saveas(9,'Lab1fig9.svg');

saveas(10,'Lab1fig10.svg');
saveas(11,'Lab1fig11.svg');
%close all