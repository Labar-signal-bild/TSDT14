%% Lab1 TSDT14
% TODO
% Ändra till filter istället för att annvända convolve
% Ta fram ett simpelt tids diskret lågpass filter med 
% cuttoff Wn.
% Räkna ut Ry1 och Ry2 med de nya tids discretra filterna
% 

%% Filter

% We have a curoff frequenci of pi/12.
F = -10:0.01:10;
Wn = 0.15;

[b1,a1]=butter(1,Wn);
[b2,a2]=butter(100,Wn);



syms f t;

Ry1 = 1/2*1/((2*pi*f)^2 + 1);
ry1 = exp(-abs(t));

Ry2 = 1/2*((F>-1/2)-(F>1/2));
ry2 = 1/2*sinc(t);

figure(1);
ezplot(Ry1);
axis([-1 1 -1 1])
title('PSD theoretical of first degree low pass filter');
xlabel('Frequency [Hz]');
ylabel('Amplitude');


figure(2)
ezplot(ry1);
title('ACF theoretical of first degree low pass filter');
xlabel('Time [s]');
ylabel('Amplitud');

figure(3)
plot(F,Ry2);
axis([-1 1 -1 1])
title('PSD theoretical of ideal low pass filter');
xlabel('Frequency [Hz]');
ylabel('Amplitud');

figure(4)
ezplot(ry2);
axis([-5 5 -1 1])
title('ACF theoretical of ideal low pass filter');
xlabel('Time [s]');
ylabel('Amplitud');

%% Bartletts 

N = 20;
n = -10:0.1:10;

x=randn(N,1);
h1 = exp(-n).*(n>0);
h2 = (n>-1/2)-(n>1/2);

yh1 = conv(h1, x);
ACFh1 = zeros(1,2*N-1);

i1 = find(yh1,1,'first');
i2 = find(yh1,2, 'last');
yh11=yh1(i1:i2);

yh2 = conv(h2, x);
ACFh2 = zeros(1,2*N-1);

i1 = find(yh2,1,'first');
i2 = find(yh2,2, 'last');
yh22=yh2(i1:i2);

for k = -N+1:N-1
    for n = 0:(N-abs(k)-1)
      ACFh1(k+N) = ACFh1(k+N)+1/N*yh11(n+1)*yh11(n+abs(k)+1);
      ACFh2(k+N) = ACFh2(k+N)+1/N*yh22(n+1)*yh22(n+abs(k)+1);
    end
end

ACFMax1=max(ACFh1);
ACFMax2=max(ACFh2);
        
figure(5)
plot([-k:k],ACFh1);
axis([-k k -ACFMax1*1.5 ACFMax1*1.5])
title('ACF estimate of first degre low pass filter');
xlabel('k');
ylabel('Amplitud');

figure(6)
plot([-k:k],ACFh2);
axis([-k k -ACFMax2*1.5 ACFMax2*1.5])
title('ACF estimate of ideal low pass filter');
xlabel('k');
ylabel('Amplitud');


%% Fourier transform of ACF

PSD1 = fft(ACFh1);
PSD2 = fft(ACFh2);

PSDMax1=max(abs(PSD1));
PSDMax2=max(abs(PSD2));

figure(7)
plot([-k:k],abs(PSD1));
axis([-k k 0 PSDMax1*1.5])
title('PSD estimate of first degre low pass filter');
xlabel('k');
ylabel('Amplitud');


figure(8)
plot([-k:k],abs(PSD2));
axis([-k k 0 PSDMax2*1.5])
title('PSD estimate of ideal low pass filter');
xlabel('k');
ylabel('Amplitud');
