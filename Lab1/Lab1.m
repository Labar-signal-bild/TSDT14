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

b1 = 1-a;
a1 = [1; -a];
[b2,a2]=butter(20,2*thetac);

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

N = 8000;

x=randn(N,1);

h2 = ifft(H2);

y1 = filter(b1,a1,x);
ACF1 = zeros(1,N);

y2 = filter(b2,a2,x);
ACF2 = zeros(1,N);

for k = -N/2+1:N/2-1
    for n = 1:(N-abs(k))
      ACF1(k+N/2) = ACF1(k+N/2)+y1(n)*y1(n+abs(k));
      ACF2(k+N/2) = ACF2(k+N/2)+y2(n)*y2(n+abs(k));
    end
end

ACF1=ACF1./N;
ACF2=ACF2./N;
ACFMax1=max(ACF1);
ACFMax2=max(ACF2);

figure(5)
plot([-k:k+1],ACF1);
axis([-k k+1 -ACFMax1*1.5 ACFMax1*1.5])
%axis([-30 30 -0.04 0.1])
title('ACF estimate of first degre low pass filter');
xlabel('k');
ylabel('Amplitud');

figure(6)
plot([-k:k+1],ACF2);
axis([-k k -ACFMax2*1.5 ACFMax2*1.5])
title('ACF estimate of ideal low pass filter');
xlabel('k');
ylabel('Amplitud');


%% Fourier transform of ACF

PSD1 = fft(ACF1);
PSD2 = fft(ACF2);

PSDMax1=max(abs(PSD1));
PSDMax2=max(abs(PSD2));

figure(7)
plot([-k:k+1],abs(PSD1));
axis([-k k+1 0 PSDMax1*1.5])
title('PSD estimate of first degre low pass filter');
xlabel('k');
ylabel('Amplitud');


figure(8)
plot([-k:k+1],abs(PSD2));
axis([-k k 0 PSDMax2*1.5])
title('PSD estimate of ideal low pass filter');
xlabel('k');
ylabel('Amplitud');

%% Averaged Periodograms

k = 200; %Antal segment som vi delar upp ACFen p�.

yN1=zeros(5*N/k,1);
yN2=zeros(5*N/k,1);
PSDAv1=zeros(N/2-1,1);
PSDAv2=zeros(N/2-1,1);

for i=1:k
yN1(2*N/k+1:3*N/k)=y1(N/k*(i-1)+1:(N/k)*i);
yN1Inv = inverter(yN1);
yN1conv = k/N*conv(yN1,yN1Inv); 

PSDAv1=PSDAv1+fft(yN1conv);

yN2(2*N/k+1:3*N/k)=y2(N/k*(i-1)+1:(N/k)*i);
yN2Inv = inverter(yN2);
yN2conv = k/N*conv(yN2,yN2Inv); 

PSDAv2=PSDAv2+fft(yN2conv);

end

PSDAv1 = PSDAv1/k;
PSDAv1Max1=max(abs(PSDAv1));

PSDAv2 = PSDAv2/k;
PSDAv2Max2=max(abs(PSDAv2));

figure(9)
plot([-N/4:N/4-2],abs(PSDAv1)); axis([-N/k N/k -PSDAv1Max1*1.5 PSDAv1Max1*1.5]); title('PSD averaging first degree low pass filter'); xlabel('k');ylabel('Amplitud');

figure(10)
plot([-N/4:N/4-2],abs(PSDAv2));axis([-N/k N/k -PSDAv2Max2*1.5 PSDAv2Max2*1.5]);title('PSD averaging high degree low pass filter');xlabel('k');ylabel('Amplitud');

%% 

