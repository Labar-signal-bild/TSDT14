%% Lab2 TSDT14


cd      /edu/alepo020/skola/TSKS14/Rapport/bilder/Lab2
addpath /edu/alepo020/skola/TSKS14/Lab2

%cd      /edu/annhj876/Skola/TSKS14/Rapport/bilder/Lab2
%addpath /edu/annhj876/Skola/TSKS14/Lab2


%% Lab 2 Teoretiska ACF & PSD

theta = 0:0.001:1;
theta0 = 0.15;
ohm0 = pi/2;

N0 = 1;

RyS = N0^2*theta0*triangularPulse((theta-1)/(2*theta0)) + ...
      N0^2*theta0*triangularPulse(theta/(2*theta0))+ ...
      N0^2*theta0^2*((theta>=0)-(theta>0)+(theta>=1));

diracwave = N0*theta0/(2*pi)*((theta>=0)-(theta>0)+(theta>=1));

rectwave = N0/8*rectangularPulse(theta/(2*theta0)) + ...
    N0/8*rectangularPulse((theta-1)/(2*theta0));

triwave = N0/(8*pi)*triangularPulse(theta/(2*theta0)) + ...
    N0/(8*pi)*triangularPulse((theta-1)/(2*theta0));

RyH = diracwave + rectwave + triwave;

RyA = N0/8*rectangularPulse((theta+ohm0/(2*pi))/(2*theta0)) + ...
      N0/8*rectangularPulse((theta-1+ohm0/(2*pi))/(2*theta0)) + ...
      N0/8*rectangularPulse((theta-ohm0/(2*pi))/(2*theta0)) + ...
      N0/8*rectangularPulse((theta-1-ohm0/(2*pi))/(2*theta0));


%% Filtrerade Signaler
%high k

N1 = 20001; % Signal length
w1 = 1/2*randn(N1,1); % White noise
[b1,a1]=butter(20,2*theta0); % Create butterworth filter parameters
x1 = filter(b1,a1,w1); %Filter our noise throuh the filter. x is our in signal
k1 = [-floor(N1/2):floor(N1/2)];

theta1 = 0:1/(N1-1):1;

%low k

N2 = 21; % Signal length
w2 = 1/2*randn(N2,1); % White noise
[b2,a2]=butter(20,2*theta0); % Create butterworth filter parameters
x2 = filter(b2,a2,w2); %Filter our noise throuh the filter. x is our in signal
k2 = [-floor(N2/2):floor(N2/2)];

theta2 = 0:1/(N2-1):1;

%high k

yS1 = x1.^2;
yH1 = [zeros(ceil(N1/2),1); x1(ceil(N1/2)+1:N1)];
yA1 = x1.*cos(ohm0*k1)';

%low k

yS2 = x2.^2;
yH2 = [zeros(ceil(N2/2),1); x2(ceil(N2/2)+1:N2)];
yA2 = x2.*cos(ohm0*k2)';
   
%% Bartletts 

Bartletts

%% Averaged Periodograms

AvrPerio

%% Smoothing 

BlaSmoothing

%%

plots
