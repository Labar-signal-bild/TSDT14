theta = 0:0.01:1;
theta0 = 0.15;
ohm0 = pi/2;

%Rx = 1/2*(theta>=0)-1/2*(theta>=thetac)+1/2*(theta>=(1-thetac)); 
% Low-passed white noise with high degree low-pass filter



N0 = 1;



RySquarer = N0^2*theta0*triangularPulse((theta-1)/(2*theta0)) + ...
    N0^2*theta0*triangularPulse(theta/(2*theta0))+ ...
    N0^2*theta0^2*((theta>=0)-(theta>0)+(theta>=1));




figure(1);
plot(theta, RySquarer);
title('Theoretical PSD of the squarer');
xlabel('?');
%ylabel('Amplitude');

diracwave = N0*theta0/(2*pi)*((theta>=0)-(theta>0)+(theta>=1));

rectwave = N0/8*rectangularPulse(theta/(2*theta0)) + ...
    N0/8*rectangularPulse((theta-1)/(2*theta0));

triwave = N0/(8*pi)*triangularPulse(theta/(2*theta0)) + ...
    N0/(8*pi)*triangularPulse((theta-1)/(2*theta0));

RyHalfWave = diracwave + rectwave + triwave;


figure(2);
plot(theta, RyHalfWave);
title('Theoretical PSD of the half wave');
xlabel('?');


RyAM = N0/8*rectangularPulse((theta+ohm0/(2*pi))/(2*theta0)) + ...
    N0/8*rectangularPulse((theta-1+ohm0/(2*pi))/(2*theta0)) + ...
    N0/8*rectangularPulse((theta-ohm0/(2*pi))/(2*theta0)) + ...
    N0/8*rectangularPulse((theta-1-ohm0/(2*pi))/(2*theta0));

figure(3);
plot(theta, RyAM);
title('Theoretical PSD of the AM');
xlabel('?');


%% Estimation

%% Better estimation with window

%% Histograms


NmbrSamples = 20000; % Signal length
n = -100:2:100;
w = 1/2*randn(NmbrSamples,1); % White noise
[b2,a2]=butter(20,2*theta0); % Create butterworth filter parameters
x = filter(b2,a2,w); %Filter our noise throuh the filter. x is our in signal

% SQUARER
y = x.^2;

histo = hist(y);


figure(4);
histogram(histo, 'BinMethod', 'auto');
%axis([0 4 0 10])
title('Theoretical PSD of the AM');
xlabel('');










