%cd      /edu/annhj876/Skola/TSKS14/Rapport/bilder/Lab3
%addpath /edu/annhj876/Skola/TSKS14/Lab3


N0 = 1;
theta = 0:0.01:1;
theta0 = 0.15;
ohm0 = pi/2;


NmbrSamples = 20001; % Signal length
n = -100:2:100;
w = 1/2*randn(NmbrSamples,1); % White noise
[b2,a2]=butter(20,2*theta0); % Create butterworth filter parameters
x = filter(b2,a2,w); %Filter our noise throuh the filter. x is our in signal
kVectorH    = [-floor(NmbrSamples/2):floor(NmbrSamples/2)];


%% (..,-1,1,-1,1,....)

Ry1 = N0/2*rectangularPulse((theta-0.5)/(2*theta0)) + ...
    N0/2*rectangularPulse((theta-1-0.5)/(2*theta0));

% Theoretical PSD
figure(1);
plot(theta, Ry1);
title('PSD');
xlabel('?');

%% 

Ry2 = (N0/8)*(rectangularPulse((theta-0.5)/(2*theta0)) + ...
    rectangularPulse((theta-1-0.5)/(2*theta0))) + ...
    (N0/8)*(rectangularPulse((theta)/(2*theta0)) + ...
    rectangularPulse((theta-1)/(2*theta0)));

% Theoretical PSD
figure(2);
plot(theta, Ry2);
title('PSD');
xlabel('?');

%% 

y1 = x.*((-1).^kVectorH)';

y2 = x.*((1+(-1).^kVectorH)/2)';










