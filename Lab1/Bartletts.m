%% Bartletts k = 4000

x=1/sqrt(2)*randn(nH,1); % White noise

%
% Filter koeficients
%

thetac = 1/12;

[b2,a2]=butter(20,2*thetac);

%
% Filtered signals
%

y1H = filter(b1,a1,x);
y2H = filter(b2,a2,x);

%
% ACF estimate
%

[ACF1H kH] = ACF_estimate(y1H);
[ACF2H kH] = ACF_estimate(y2H);

ACFMax1H=max(ACF1H);
ACFMax2H=max(ACF2H);

%
% ACF estimate plots
%

ACFMax1H=max(ACF1H);
ACFMax2H=max(ACF2H);

%% Bartletts k = 40


load('x.mat') % White noise

%
% Filter koeficients
%

thetac = 1/12;





%
% Filtered signals
%

y1L = filter(b1,a1,x);
y2L = filter(b2,a2,x);

%
% ACF estimate
%

[ACF1L kL] = ACF_estimate(y1L);
[ACF2L kL] = ACF_estimate(y2L);

ACFMax1L=max(ACF1L);
ACFMax2L=max(ACF2L);

%
% ACF estimate plots
%

ACFMax1L=max(ACF1L);
ACFMax2L=max(ACF2L);

%% PSD

PSD1H = fft(ACF1H);
PSD2H = fft(ACF2H);

PSDMax1H=max(abs(PSD1H));
PSDMax2H=max(abs(PSD2H));

PSD1L = fft(ACF1L);
PSD2L = fft(ACF2L);

PSDMax1L=max(abs(PSD1L));
PSDMax2L=max(abs(PSD2L));

