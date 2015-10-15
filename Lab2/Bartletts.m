%% Bartletts k = 40000

%
% ACF estimate
%

ACF1S = ACF_estimate(yS1);
ACF1H = ACF_estimate(yH1);
ACF1A = ACF_estimate(yA1);

ACFMax1S=max(ACF1S);
ACFMax1H=max(ACF1H);
ACFMax1A=max(ACF1A);


%% Bartletts k = 20



ACF2S = ACF_estimate(yS2);
ACF2H = ACF_estimate(yH2);
ACF2A = ACF_estimate(yA2);

ACFMax2S=max(ACF2S);
ACFMax2H=max(ACF2H);
ACFMax2A=max(ACF2A);


%% PSD

PSD1S = fft(ACF1S);
PSD1H = fft(ACF1H);
PSD1A = fft(ACF1A);

PSDMax1S=max(abs(PSD1S));
PSDMax1H=max(abs(PSD1H));
PSDMax1A=max(abs(PSD1A));

PSD2S = fft(ACF2S);
PSD2H = fft(ACF2H);
PSD2A = fft(ACF2A);

PSDMax2S=max(abs(PSD2S));
PSDMax2H=max(abs(PSD2H));
PSDMax2A=max(abs(PSD2A));


