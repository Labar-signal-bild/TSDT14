%% Averaged Periodograms

k = 100; %Antal segment som vi delar upp ACFen i

%
% Calculating Periodograms
%

PSDAv1 = PERIO(y1H,k);
PSDAv2 = PERIO(y2H,k);

%
% Inverstransformering för att få ACFn
%

ACFAv1 = ifft(PSDAv1);
ACFAv2 = ifft(PSDAv2);

%
% Calculating axis lengths
%

nAv = length(PSDAv1);
kAv = -nAv/2+1/2:nAv/2-1/2;

thetaAv = 0:1/(nAv-1):1;

PSDAv1Max1=max(abs(PSDAv1));
PSDAv2Max2=max(abs(PSDAv2));

ACFAv1Max1=max(abs(ACFAv1));
ACFAv2Max2=max(abs(ACFAv2));

Ry1Av = 1/2*(abs((b1(1)+b1(2)*exp(-1i*2*pi*thetaAv))./(1+a1(2)*exp(-1i*2*pi*thetaAv))).^2);
Ry2Av = 1/2*(thetaAv>=0)-1/2*(thetaAv>=thetac)+1/2*(thetaAv>=(1-thetac));

