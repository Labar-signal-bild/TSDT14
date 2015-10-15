cd      /edu/annhj876/Skola/TSKS14/Rapport/bilder/Lab2
addpath /edu/annhj876/Skola/TSKS14/Lab2



theta = 0:0.01:1;
theta0 = 0.15;
ohm0 = pi/2;

%Rx = 1/2*(theta>=0)-1/2*(theta>=thetac)+1/2*(theta>=(1-thetac)); 
% Low-passed white noise with high degree low-pass filter



N0 = 1;



RySquarer = N0^2*theta0*triangularPulse((theta-1)/(2*theta0)) + ...
    N0^2*theta0*triangularPulse(theta/(2*theta0))+ ...
    N0^2*theta0^2*((theta>=0)-(theta>0)+(theta>=1));



% Theoretical PSD of squarer
figure(1);
plot(theta, RySquarer);
title('PSD');
xlabel('?');
%ylabel('Amplitude');

diracwave = N0*theta0/(2*pi)*((theta>=0)-(theta>0)+(theta>=1));

rectwave = N0/8*rectangularPulse(theta/(2*theta0)) + ...
    N0/8*rectangularPulse((theta-1)/(2*theta0));

triwave = N0/(8*pi)*triangularPulse(theta/(2*theta0)) + ...
    N0/(8*pi)*triangularPulse((theta-1)/(2*theta0));

RyHalfWave = diracwave + rectwave + triwave;

% Theoretical PSD of half-wave rectifier
figure(2);
plot(theta, RyHalfWave);
title('PSD');
xlabel('?');


RyAM = N0/8*rectangularPulse((theta+ohm0/(2*pi))/(2*theta0)) + ...
    N0/8*rectangularPulse((theta-1+ohm0/(2*pi))/(2*theta0)) + ...
    N0/8*rectangularPulse((theta-ohm0/(2*pi))/(2*theta0)) + ...
    N0/8*rectangularPulse((theta-1-ohm0/(2*pi))/(2*theta0));

% Theoretical PSD of AM-SC modulation
figure(3);
plot(theta, RyAM);
title('PSD');
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



%--------------- SQUARER -------------------
ySquarer = x.^2;

% Histogram of outsignal from squarer
figure(4);
histogram(ySquarer);
title('Histogram');
xlabel('n');



% -------------------- AM modulator -------------------

yAM = x*cos(ohm0*n);

% Histogram of outsignal from AM modulator
figure(6);
histogram(yAM, 150);
title('Histogram');
xlabel('n');

%--------------- Half-Wave --------------------
NmbrSamples = 201; % Signal length
n = -100:2:100;
w = 1/2*randn(NmbrSamples,1); % White noise
[b2,a2]=butter(20,2*theta0); % Create butterworth filter parameters
x = filter(b2,a2,w); %Filter our noise throuh the filter. x is our in signal
kVectorH    = [-floor(NmbrSamples/2):floor(NmbrSamples/2)];


yHalfWave = x*(1-(kVectorH<0));

% Histogram of outsignal from half-wave
figure(5);
histogram(yHalfWave);
title('Histogram');
xlabel('n');



saveas(1,'Lab2fig1.svg');
saveas(2,'Lab2fig2.svg');

saveas(3,'Lab2fig3.svg');
saveas(4,'Lab2fig4.svg');
saveas(5,'Lab2fig5.svg');
saveas(6,'Lab2fig6.svg');








