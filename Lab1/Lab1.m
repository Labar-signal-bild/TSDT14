%% Lab1 TSDT14
% TODO
% Ändra till filter istället för att annvända convolve
% Ta fram ett simpelt tids diskret lågpass filter med 
% cuttoff Wn.
% Räkna ut Ry1 och Ry2 med de nya tids discretra filterna
% 

%% Filter

% We have a cutoff frequenci of pi/12.
theta = 0:0.01:10;
n = -100:2:100;
thetac = 1/12;
a = 0.778;

H2 = 1/thetac*rectangularPulse(theta/thetac);

Ry1 = 1/2*(abs((1-a)./(1-a*exp(-1i*2*pi*theta))).^2);
ry1 = 1/2*(1-a)/(1+a).*a.^(abs(n));

Ry2 = 1/2*(theta>=0)-1/2*(theta>=thetac)+1/2*(theta>=(1-thetac));
ry2 = 1/2*2*thetac*sinc(2*thetac*n);

figure(1);
plot(theta, Ry1);
axis([0 1 0 0.6])
title('PSD theoretical of first degree low pass filter');
xlabel('?');
ylabel('Amplitude');


figure(2)
stem(n, ry1);
axis([-100 100 0 0.07])
title('ACF theoretical of first degree low pass filter');
xlabel('n');
ylabel('Amplitud');
 
figure(3)
plot(theta,Ry2);
axis([0 1 -0.01 0.6])
title('PSD theoretical of ideal low pass filter');
xlabel('?');
ylabel('Amplitud');

figure(4)
stem(n, ry2);
axis([-30 30 -0.04 0.1])
title('ACF theoretical of ideal low pass filter');
xlabel('n');
ylabel('Amplitud');

%% Bartletts 

NmbrSamples = 1000; % Signal length
kVector     = [-NmbrSamples/2+1/2:NmbrSamples/2-1/2];
thetaVector = [0:1/(NmbrSamples-1):1];
x=randn(NmbrSamples,1); % White noise

%
% Filter koeficients
%

thetac = 1/12;
a = 0.778;

b1 = 1-a;
a1 = [1; -a];
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

%% Smoothing 

n = length(y1);


%
% Plot Windows
%



%
% ACF Smoothing
%

ACF1Smooth = Smoothing(ACF1,'bajs');

%
% PSD Smoothing
%

%
% Axis
%


