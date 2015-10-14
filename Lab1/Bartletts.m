%%

cd      /edu/alepo020/skola/TSKS14/Rapport/bilder/Lab1
addpath /edu/alepo020/skola/TSKS14/Lab1

%% Bartletts k = 4000

NmbrSamples = 20001; % Signal length
kVector     = [-floor(NmbrSamples/2):floor(NmbrSamples/2)];
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

ACF1H = ACF_estimate(y1);
ACF2H = ACF_estimate(y2);

ACFMax1H=max(ACF1H);
ACFMax2H=max(ACF2H);

%
% ACF estimate plots
%

kVectorH     = [-NmbrSamples/2+1/2:NmbrSamples/2-1/2];
thetaVectorH = [0:1/(NmbrSamples-1):1];

ACFMax1H=max(ACF1H);
ACFMax2H=max(ACF2H);

%% Bartletts k = 20

NmbrSamples = 41; % Signal length
kVectorL    = [-floor(NmbrSamples/2):floor(NmbrSamples/2)];
thetaVectorL = [0:1/(NmbrSamples-1):1];
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

ACF1L = ACF_estimate(y1);
ACF2L = ACF_estimate(y2);

ACFMax1L=max(ACF1L);
ACFMax2L=max(ACF2L);

%
% ACF estimate plots
%

ACFMax1L=max(ACF1L);
ACFMax2L=max(ACF2L);

%%

% ACF H mot L

figure(3)
subplot(2,1,1);
stem(kVectorL,ACF1L);
axis([min(kVectorL) max(kVectorL) -ACFMax1L*0.5 ACFMax1L*1.5])
title('ACF |k|<20');
xlabel('k');

subplot(2,1,2)
plot(kVectorH,ACF2H);
axis([min(kVectorH) max(kVectorH) -ACFMax2H*0.3 ACFMax2H*1.5])
title('ACF |k|<10^4');
xlabel('k');

%%
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