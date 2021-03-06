%% Bartletts k = 40000

N1 = 20001; % Signal length
theta1 = 0:1/((2*N1-1)-1):1;


%
% ACF estimate
%

[ACF1 k1]= ACF_estimate(y1);
[ACF2 k2]= ACF_estimate(y2);

ACFMax1=max(ACF1);
ACFMax2=max(ACF2);



%% PSD

PSD1 = fft(ACF1);
PSD2 = fft(ACF2);


PSDMax1=max(abs(PSD1));
PSDMax2=max(abs(PSD2));


%% Plot


% PSD Bartletts

figure(3);
plot(theta1, abs(PSD1));
%axis([0 1 0 0.3])
title('PSD (-1)^n');
xlabel('\theta');


    hold on
    plot(theta, Ry1);
    hold off


figure(4);
plot(theta1, abs(PSD2));
%axis([0 1 0 PSDMax1H*1.1])
title('PSD (..0,1,..)');
xlabel('\theta');

    hold on
    plot(theta, Ry2);
    hold off
    
    
print(3,'Lab3fig3.eps','-depsc','-loose');
print(4,'Lab3fig4.eps','-depsc','-loose');


