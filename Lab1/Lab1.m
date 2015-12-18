%% Lab1 TSDT14
% TODO
% Ändra till filter istället för att annvända convolve
% Ta fram ett simpelt tids diskret lågpass filter med 
% cuttoff Wn.
% Räkna ut Ry1 och Ry2 med de nya tids discretra filterna
% 

cd      /edu/alepo020/skola/TSKS14/Rapport/bilder/Lab1
addpath /edu/alepo020/skola/TSKS14/Lab1

%cd      /edu/annhj876/Skola/TSKS14/Rapport/bilder/Lab1
%addpath /edu/annhj876/Skola/TSKS14/Lab1

%% Filter

% We have a cutoff frequenci of pi/12.
%theta = 0:0.001:10;
n = -100:1:100;
thetac = 1/12;

nH = 20001;
nL = 41;

kH = -floor(nH/2):floor(nH/2);
kL = -floor(nL/2):floor(nL/2);

thetaH = [0:1/(nH-1):1];
thetaL = [0:1/(nL-1):1];

a = 0.78;
b1 = 1-a;

a1 = [1; -a];



Ry1 = 1/2*(abs(b1(1)./(1+a1(2)*exp(-1i*2*pi*thetaH))).^2);
ry1 = 1/2*(1-a)/(1+a).*a.^(abs(n));

Ry2 = 1/2*(thetaH>=0)-1/2*(thetaH>=thetac)+1/2*(thetaH>=(1-thetac));
ry2 = 1/2*2*thetac*sinc(2*thetac*n);


%% Bartletts 

Bartletts

%% Averaged Periodograms

AvrPerio

%% Smoothing 

BlaSmoothing

%%

plots
