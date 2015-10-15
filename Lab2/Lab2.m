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


NmbrSamples = 20001; % Signal length
n = -100:2:100;
w = 1/2*randn(NmbrSamples,1); % White noise
[b2,a2]=butter(20,2*theta0); % Create butterworth filter parameters
x = filter(b2,a2,w); %Filter our noise throuh the filter. x is our in signal
kVectorH    = [-floor(NmbrSamples/2):floor(NmbrSamples/2)];
% SQUARER
ySquarer = x.^2;


figure(4);
histogram(ySquarer);
%axis([0 4 0 10])
title('Histogram of the output of the squarer');
xlabel('n');

figure(11);
plot(kVectorH, ySquarer)
axis([-10^4 10^4 -1.5 1.5]) %Ser ut som jag vill

%Half-Wave
NmbrSamples = 2001;
%yHalfWave = x(ceil(NmbrSamples/2)+1:NmbrSamples);
yHalfWave = x*(1-(kVectorH<0));

figure(10);
plot(yHalfWave)
axis([-10^4 10^4 -1.5 1.5]) %Ser ut som jag vill

figure(5);
histogram(yHalfWave);
%axis([0 4 0 10])
title('Histogram of the output of the Half-wave rectifier');
xlabel('n');

% AM modulator
NmbrSamples = 20001;
yAM = x*cos(ohm0*n);

figure(12);
plot(yAM)
axis([-10^4 10^4 -1.5 1.5])

figure(6);
histogram(yAM, 150);
title('Histogram of the output of the AM-SC modulater');
xlabel('n');













