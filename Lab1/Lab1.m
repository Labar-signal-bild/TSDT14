%% Lab1 TSDT14
% TODO
% Ändra till filter istället för att annvända convolve
% Ta fram ett simpelt tids diskret lågpass filter med 
% cuttoff Wn.
% Räkna ut Ry1 och Ry2 med de nya tids discretra filterna
% 

cd      /edu/alepo020/skola/TSKS14/Rapport/bilder/Lab1
addpath /edu/alepo020/skola/TSKS14/Lab1

%cd      /edu/anahj876/Skola/TSKS14/Rapport/bilder/Lab1
%addpath /edu/anahj876/Skola/TSKS14/Lab1

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

%% Bartletts 

Bartletts

%% Averaged Periodograms

AvrPerio

%% Smoothing 

BlaSmoothing

%%

plots
