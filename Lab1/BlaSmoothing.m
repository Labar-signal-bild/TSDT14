%% Blackman smoothing

%
% ACF Smoothing
%

ACF1Ham = Smoothing(ACF1H,'hamming');
ACF1Han = Smoothing(ACF1H,'hanning');
ACF1Bla = Smoothing(ACF1H,'blackman');
%ACF1Box = Smoothing(ACF1H,'boxcar');

ACF2Ham = Smoothing(ACF2H,'hamming');
ACF2Han = Smoothing(ACF2H,'hanning');
ACF2Bla = Smoothing(ACF2H,'blackman');
%ACF2Box = Smoothing(ACF2H,'boxcar');

%
% PSD Smoothing
%

PSD1Ham = fft(ACF1Ham);
PSD1Han = fft(ACF1Han);
PSD1Bla = fft(ACF1Bla);
%PSD1Box = fft(ACF1Box);

PSD2Ham = fft(ACF2Ham);
PSD2Han = fft(ACF2Han);
PSD2Bla = fft(ACF2Bla);
%PSD2Box = fft(ACF2Box);

%% Axises

NmbrSamples = length(ACF1H);
kVector     = [-NmbrSamples/2+1/2:NmbrSamples/2-1/2];
thetaVector = [0:1/(NmbrSamples-1):1];