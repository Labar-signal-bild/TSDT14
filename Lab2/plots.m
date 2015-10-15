%% Plots

figure(1);
subplot(3,1,1)
plot(theta, RyS);
title('PSD Squarer');
xlabel('\theta');

subplot(3,1,2)
plot(theta, RyH);
title('PSD Half-wave rectifier');
xlabel('\theta');

subplot(3,1,3)
plot(theta,RyA);
title('PSD AM-SC modulator');
xlabel('\theta');




%%

% PSD Bartletts

figure(2);
subplot(3,1,1)
plot(theta1, abs(PSD1S));
axis([0 1 0 0.3])
title('PSD Squarer');
xlabel('\theta');

    hold on
    subplot(3,1,1)
    plot(theta, RyS);
    hold off

subplot(3,1,2)
plot(theta1, abs(PSD1H));
axis([0 1 0 PSDMax1H*1.1])
title('PSD Half-wave rectifier');
xlabel('\theta');

    hold on
    subplot(3,1,2)
    plot(theta, RyH);
    hold off

subplot(3,1,3)
plot(theta1, abs(PSD1A));
axis([0 1 0 PSDMax1A*1.1])
title('PSD AM-SC modulator');
xlabel('\theta');

    hold on
    subplot(3,1,3)
    plot(theta,RyA);
    hold off

%% Averaged periods

figure(3);
subplot(3,1,1)
plot(thetaAvS, abs(PSDAvS));
axis([0 1 0 0.3])
title('PSD Squarer');
xlabel('\theta');

    hold on
    subplot(3,1,1)
    plot(theta, RyS);
    hold off

subplot(3,1,2)
plot(thetaAvH, abs(PSDAvH));
axis([0 1 0 0.25])
title('PSD Half-wave rectifier');
xlabel('\theta');

    hold on
    subplot(3,1,2)
    plot(theta, RyH);
    hold off

subplot(3,1,3)
plot(thetaAvA, abs(PSDAvA));
axis([0 1 0 0.25])
title('PSD AM-SC modulator');
xlabel('\theta');

    hold on
    subplot(3,1,3)
    plot(theta,RyA);
    hold off


%% Smoothing blackman

figure(4);
subplot(3,1,1)
plot(theta1, abs(PSDBlaS));
axis([0 1 0 0.3])
title('PSD Squarer');
xlabel('\theta');

    hold on
    subplot(3,1,1)
    plot(theta, RyS);
    hold off

subplot(3,1,2)
plot(theta1, abs(PSDBlaH));
axis([0 1 0 PSDMax1H*1.1])
title('PSD Half-wave rectifier');
xlabel('\theta');

    hold on
    subplot(3,1,2)
    plot(theta, RyH);
    hold off

subplot(3,1,3)
plot(theta1, abs(PSDBlaA));
axis([0 1 0 PSDMax1A*1.1])
title('PSD AM-SC modulator');
xlabel('\theta');

    hold on
    subplot(3,1,3)
    plot(theta,RyA);
    hold off


%% 

saveas(1,'Lab2fig1.svg');
saveas(2,'Lab2fig2.svg');
saveas(3,'Lab2fig3.svg');

%close all