%% Lab1 TSDT14
% TODO
% Ändra till filter istället för att annvända convolve
% Ta fram ett simpelt tids diskret lågpass filter med 
% cuttoff Wn.
% Räkna ut Ry1 och Ry2 med de nya tids discretra filterna
% 

cd      /edu/alepo020/skola/TSKS14/Rapport/bilder/Lab1
addpath /edu/alepo020/skola/TSKS14/Lab1

%% Filter

% We have a cutoff frequenci of pi/12.
theta = 0:0.001:10;
n = -100:2:100;
thetac = 1/12;

[b1,a1]=butter(1,2*thetac);

a = 0.78;


Ry1 = 1/2*(abs((b1(1)+b1(2)*exp(-1i*2*pi*theta))./(1+a1(2)*exp(-1i*2*pi*theta))).^2);
ry1 = 1/2*(1-a)/(1+a).*a.^(abs(n));

Ry2 = 1/2*(theta>=0)-1/2*(theta>=thetac)+1/2*(theta>=(1-thetac));
ry2 = 1/2*2*thetac*sinc(2*thetac*n);

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

saveas(1,'Lab1fig1.svg');
saveas(2,'Lab1fig2.svg');

%% Bartletts 

NmbrSamples = 20000; % Signal length
kVector     = [-NmbrSamples/2+1/2:NmbrSamples/2-1/2];
thetaVector = [0:1/(NmbrSamples-1):1];
x=1/2*randn(NmbrSamples,1); % White noise

%
% Filter koeficients
%

thetac = 1/12;


[b1,a1]=butter(1,2*thetac);
[b2,a2]=butter(20,2*thetac);

%
% Filtered signals
%

y1 = filter(b1,a1,x);
y2 = filter(b2,a2,x);

%
% ACF estimate
%

ACF1 = ACF_estimate(y1);
ACF2 = ACF_estimate(y2);

ACFMax1=max(ACF1);
ACFMax2=max(ACF2);

%
% ACF estimate plots
%

kVector     = [-NmbrSamples/2+1/2:NmbrSamples/2-1/2];
thetaVector = [0:1/(NmbrSamples-1):1];

ACFMax1=max(ACF1);
ACFMax2=max(ACF2);

figure(5)
plot(kVector,ACF1);
axis([min(kVector) max(kVector) -ACFMax1*1.5 ACFMax1*1.5])
title('ACF estimate of first degre low pass filter');
xlabel('k');
ylabel('Amplitud');

figure(6)
plot(kVector,ACF2);
axis([min(kVector) max(kVector) -ACFMax2*1.5 ACFMax2*1.5])
title('ACF estimate of ideal low pass filter');
xlabel('k');
ylabel('Amplitud');


% PSD

PSD1 = fft(ACF1);
PSD2 = fft(ACF2);

PSDMax1=max(abs(PSD1));
PSDMax2=max(abs(PSD2));

figure(7)
plot(thetaVector,abs(PSD1));
axis([min(thetaVector) max(thetaVector) -PSDMax1*1.5 PSDMax1*1.5])
title('PSD estimate of first degre low pass filter');
xlabel('theta');
ylabel('Amplitud');


figure(8)
plot(thetaVector,abs(PSD2));
axis([min(thetaVector) max(thetaVector) -PSDMax2*1.5 PSDMax2*1.5])
title('PSD estimate of ideal low pass filter');
xlabel('theta');
ylabel('Amplitud');

%saveas(5,'Lab1fig5.svg');
%saveas(6,'Lab1fig6.svg');
%saveas(7,'Lab1fig7.svg');
%saveas(8,'Lab1fig8.svg');

%% Averaged Periodograms

k = 20; %Antal segment som vi delar upp ACFen p�.

%
% Calculating Periodograms
%

PSDAv1 = PERIO(y1,k);
PSDAv2 = PERIO(y2,k);

%
% Inverstransformering för att få ACFn
%

ACFAv1 = ifft(PSDAv1);
ACFAv2 = ifft(PSDAv2);

%
% Calculating axis lengths
%

NmbrSamples = length(PSDAv1);

thetaVector = 0:1/(NmbrSamples-1):1;

sampleVector = -NmbrSamples/2+1/2:NmbrSamples/2-1/2;

PSDAv1Max1=max(abs(PSDAv1));
PSDAv2Max2=max(abs(PSDAv2));

ACFAv1Max1=max(abs(ACFAv1));
ACFAv2Max2=max(abs(ACFAv2));

%
% Plottar
%

figure(9)
plot(thetaVector,abs(PSDAv1)); 
axis([0 1 -PSDAv1Max1*1.5 PSDAv1Max1*1.5]); 
title('PSD averaging first degree low pass filter'); 
xlabel('theta');
ylabel('Amplitud');

figure(10)
plot(thetaVector,abs(PSDAv2));
axis([0 1 -PSDAv2Max2*1.5 PSDAv2Max2*1.5]);
title('PSD averaging high degree low pass filter');
xlabel('theta');
ylabel('Amplitud');

figure(11)
plot(sampleVector,abs(ACFAv1)); 
axis([-500 500 -ACFAv1Max1*1.5 ACFAv1Max1*1.5]); 
title('ACF averaging first degree low pass filter'); 
xlabel('k');
ylabel('Amplitud');

figure(12)
plot(sampleVector,abs(ACFAv2));
axis([-500 500 -ACFAv2Max2*1.5 ACFAv2Max2*1.5]);
title('ACF averaging high degree low pass filter');
xlabel('k');
ylabel('Amplitud');

saveas(9,'Lab1fig9.svg');
saveas(10,'Lab1fig10.svg');
saveas(11,'Lab1fig11.svg');
saveas(12,'Lab1fig12.svg');

%% Smoothing 

%
% Plot Windows
%

%ACF1Smooth = Smoothing(ACF1,'plot');

%
% ACF Smoothing
%

ACF1Ham = Smoothing(ACF1,'hamming');
ACF1Han = Smoothing(ACF1,'hanning');
ACF1Bla = Smoothing(ACF1,'blackman');
ACF1Box = Smoothing(ACF1,'boxcar');

ACF2Ham = Smoothing(ACF2,'hamming');
ACF2Han = Smoothing(ACF2,'hanning');
ACF2Bla = Smoothing(ACF2,'blackman');
ACF2Box = Smoothing(ACF2,'boxcar');

%
% PSD Smoothing
%

PSD1Ham = fft(ACF1Ham);
PSD1Han = fft(ACF1Han);
PSD1Bla = fft(ACF1Bla);
PSD1Box = fft(ACF1Box);

PSD2Ham = fft(ACF2Ham);
PSD2Han = fft(ACF2Han);
PSD2Bla = fft(ACF2Bla);
PSD2Box = fft(ACF2Box);

%% Axises

NmbrSamples = length(ACF1);
kVector     = [-NmbrSamples/2+1/2:NmbrSamples/2-1/2];
thetaVector = [0:1/(NmbrSamples-1):1];

%% Hamming plots

ACFMax1=max(ACF1Ham);
ACFMax2=max(ACF2Ham);

figure(17)
plot(kVector,ACF1Ham);
axis([min(kVector) max(kVector) -ACFMax1*1.5 ACFMax1*1.5])
title('ACF estimate of first degre low pass filter');
xlabel('k');
ylabel('Amplitud');

figure(18)
plot(kVector,ACF2Ham);
axis([min(kVector) max(kVector) -ACFMax2*1.5 ACFMax2*1.5])
title('ACF estimate of ideal low pass filter');
xlabel('k');
ylabel('Amplitud');


% PSD

PSDMax1=max(abs(PSD1Ham));
PSDMax2=max(abs(PSD2Ham));

figure(19)
plot(thetaVector,abs(PSD1Ham));
axis([min(thetaVector) max(thetaVector) -PSDMax1*1.5 PSDMax1*1.5])
title('PSD estimate of first degre low pass filter');
xlabel('theta');
ylabel('Amplitud');


figure(20)
plot(thetaVector,abs(PSD2Ham));
axis([min(thetaVector) max(thetaVector) -PSDMax2*1.5 PSDMax2*1.5])
title('PSD estimate of ideal low pass filter');
xlabel('theta');
ylabel('Amplitud');

saveas(17,'Lab1fig17.svg');
saveas(18,'Lab1fig18.svg');
saveas(19,'Lab1fig19.svg');
saveas(20,'Lab1fig20.svg');

%% Hanning plots

ACFMax1=max(ACF1Han);
ACFMax2=max(ACF2Han);

figure(21)
plot(kVector,ACF1Han);
axis([min(kVector) max(kVector) -ACFMax1*1.5 ACFMax1*1.5])
title('ACF estimate of first degre low pass filter');
xlabel('k');
ylabel('Amplitud');

figure(22)
plot(kVector,ACF2Han);
axis([min(kVector) max(kVector) -ACFMax2*1.5 ACFMax2*1.5])
title('ACF estimate of ideal low pass filter');
xlabel('k');
ylabel('Amplitud');


% PSD

PSDMax1=max(abs(PSD1Han));
PSDMax2=max(abs(PSD2Han));

figure(23)
plot(thetaVector,abs(PSD1Han));
axis([min(thetaVector) max(thetaVector) -PSDMax1*1.5 PSDMax1*1.5])
title('PSD estimate of first degre low pass filter');
xlabel('theta');
ylabel('Amplitud');


figure(24)
plot(thetaVector,abs(PSD2Han));
axis([min(thetaVector) max(thetaVector) -PSDMax2*1.5 PSDMax2*1.5])
title('PSD estimate of ideal low pass filter');
xlabel('theta');
ylabel('Amplitud');

saveas(21,'Lab1fig21.svg');
saveas(22,'Lab1fig22.svg');
saveas(23,'Lab1fig23.svg');
saveas(24,'Lab1fig24.svg');

%% Blackman plots

ACFMax1=max(ACF1Bla);
ACFMax2=max(ACF2Bla);

figure(25)
plot(kVector,ACF1Bla);
axis([min(kVector) max(kVector) -ACFMax1*1.5 ACFMax1*1.5])
title('ACF estimate of first degre low pass filter');
xlabel('k');
ylabel('Amplitud');

figure(26)
plot(kVector,ACF2Bla);
axis([min(kVector) max(kVector) -ACFMax2*1.5 ACFMax2*1.5])
title('ACF estimate of ideal low pass filter');
xlabel('k');
ylabel('Amplitud');


% PSD

PSDMax1=max(abs(PSD1Bla));
PSDMax2=max(abs(PSD2Bla));

figure(27)
plot(thetaVector,abs(PSD1Bla));
axis([min(thetaVector) max(thetaVector) -PSDMax1*1.5 PSDMax1*1.5])
title('PSD estimate of first degre low pass filter');
xlabel('theta');
ylabel('Amplitud');


figure(28)
plot(thetaVector,abs(PSD2Bla));
axis([min(thetaVector) max(thetaVector) -PSDMax2*1.5 PSDMax2*1.5])
title('PSD estimate of ideal low pass filter');
xlabel('theta');
ylabel('Amplitud');

saveas(25,'Lab1fig25.svg');
saveas(26,'Lab1fig26.svg');
saveas(27,'Lab1fig27.svg');
saveas(28,'Lab1fig28.svg');

%% Boxcar plots

ACFMax1=max(ACF1Box);
ACFMax2=max(ACF2Box);

figure(29)
plot(kVector,ACF1Box);
axis([min(kVector) max(kVector) -ACFMax1*1.5 ACFMax1*1.5])
title('ACF estimate of first degre low pass filter');
xlabel('k');
ylabel('Amplitud');

figure(30)
plot(kVector,ACF2Box);
axis([min(kVector) max(kVector) -ACFMax2*1.5 ACFMax2*1.5])
title('ACF estimate of ideal low pass filter');
xlabel('k');
ylabel('Amplitud');


% PSD

PSDMax1=max(abs(PSD1Box));
PSDMax2=max(abs(PSD2Box));

figure(31)
plot(thetaVector,abs(PSD1Box));
axis([min(thetaVector) max(thetaVector) -PSDMax1*1.5 PSDMax1*1.5])
title('PSD estimate of first degre low pass filter');
xlabel('theta');
ylabel('Amplitud');


figure(32)
plot(thetaVector,abs(PSD2Box));
axis([min(thetaVector) max(thetaVector) -PSDMax2*1.5 PSDMax2*1.5])
title('PSD estimate of ideal low pass filter');
xlabel('theta');
ylabel('Amplitud');

saveas(29,'Lab1fig29.svg');
saveas(30,'Lab1fig30.svg');
saveas(31,'Lab1fig31.svg');
saveas(32,'Lab1fig32.svg');