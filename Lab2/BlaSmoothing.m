%% Blackman smoothing

%
% ACF Smoothing
%

ACFBlaH = Smoothing(ACF1S,'blackman');
ACFBlaS = Smoothing(ACF1H,'blackman');
ACFBlaA = Smoothing(ACF1A,'blackman');

%
% PSD Smoothing
%

PSDBlaH = fft(ACFBlaH);
PSDBlaS = fft(ACFBlaS);
PSDBlaA = fft(ACFBlaA);