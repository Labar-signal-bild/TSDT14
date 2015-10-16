%cd      /edu/annhj876/Skola/TSKS14/Rapport/bilder/Lab2
%addpath /edu/annhj876/Skola/TSKS14/Lab2

cd      /edu/alepo020/skola/TSKS14/Rapport/bilder/Lab2
addpath /edu/alepo020/skola/TSKS14/Lab2

theta = 0:0.001:1;
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
xlabel('\theta');
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
xlabel('\theta');


RyAM = N0/8*rectangularPulse((theta+ohm0/(2*pi))/(2*theta0)) + ...
    N0/8*rectangularPulse((theta-1+ohm0/(2*pi))/(2*theta0)) + ...
    N0/8*rectangularPulse((theta-ohm0/(2*pi))/(2*theta0)) + ...
    N0/8*rectangularPulse((theta-1-ohm0/(2*pi))/(2*theta0));

% Theoretical PSD of AM-SC modulation
figure(3);
plot(theta, RyAM);
title('PSD');
xlabel('\theta');


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



%yHalfWave1 = x.*(1-(kVectorH<0))
yHalfWave = [zeros(ceil(NmbrSamples/2),1); x(ceil(NmbrSamples/2)+1:NmbrSamples)]


% Histogram of outsignal from half-wave
figure(5);
histogram(yHalfWave);
axis([-1 1 0 12000])
title('Histogram');
xlabel('n');



print(1,'Lab2fig1.eps','-depsc','-loose');
print(2,'Lab2fig2.eps','-depsc','-loose');

print(3,'Lab2fig3.eps','-depsc','-loose');
print(4,'Lab2fig4.eps','-depsc','-loose');
print(5,'Lab2fig5.eps','-depsc','-loose');
print(6,'Lab2fig6.eps','-depsc','-loose');








