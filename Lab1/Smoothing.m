function ACFSmooth = Smoothing(ACF, window)
n = length(ACF);
Padding = zeros(floor(n/4),1);

%
% Windows
%

Ham = hamming(n);%[Padding; hamming(n/2);  Padding];
Han = hanning(n);%[Padding; hanning(n/2);  Padding];
Bla = blackman(n);%[Padding; blackman(n/2); Padding];
Box = [Padding; boxcar(floor(n/2));   Padding];

if strcmp('hamming',window)
    ACFSmooth = ACF.*Ham';
    
elseif strcmp('hanning',window)
    ACFSmooth = ACF.*Han';
    
elseif strcmp('blackman',window)
    ACFSmooth = ACF.*Bla';
    
elseif strcmp('boxcar',window)
    ACFSmooth = ACF.*Box';
    
elseif strcmp('plot',window)
    figure(11)
    subplot(2,2,1)
    plot(Ham);
    axis([1 n 0 1]);
    title('Hamming window');
    
    subplot(2,2,2)
    plot(Han);
    axis([1 n  0 1]);
    title('Hanning window');
    
    subplot(2,2,3)
    plot(Bla);
    axis([1 n 0 1]);
    title('Blackman window');
    
    subplot(2,2,4)
    plot(Box);
    axis([1 n 0 1]);
    title('Rectangualr window');
    
    ACFSmooth = 0;
else
    display('-----------Error-no-window-match-------------')
    ACFSmooth = 0;
end
end


