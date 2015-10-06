function ACFSmooth = Smoothing(ACF, window)
n = length(ACF);
Padding = zeros(n/4,1);

%
% Windows
%

Ham = [Padding; hamming(n/2);  Padding];
Han = [Padding; hanning(n/2);  Padding];
Bla = [Padding; blackman(n/2); Padding];
Box = [Padding; boxcar(n/2);   Padding];

if strcmp('hamming',window)
    ACFSmooth = ACF*Ham;
    
elseif strcmp('hanning',window)
    ACFSmooth = ACF*Han;
    
elseif strcmp('blackman',window)
    ACFSmooth = ACF*Han;
    
elseif strcmp('boxcar',window)
    ACFSmooth = ACF*Bla;
    
elseif strcmp('plot',window)
    figure(13)
    plot(Ham);
    axis([1 n 0 1]);
    title('ACF averaging high degree low pass filter');
    xlabel('k');
    ylabel('Amplitud');
    
    figure(14)
    plot(Han);
    axis([1 n  0 1]);
    title('ACF averaging high degree low pass filter');
    xlabel('k');
    ylabel('Amplitud');
    
    figure(15)
    plot(Bla);
    axis([1 n 0 1]);
    title('ACF averaging high degree low pass filter');
    xlabel('k');
    ylabel('Amplitud');
    
    figure(16)
    plot(Box);
    axis([1 n 0 1]);
    title('ACF averaging high degree low pass filter');
    xlabel('k');
    ylabel('Amplitud');
    
    ACFSmooth = 0;
else
    display('-----------Error-no-window-match-------------')
    ACFSmooth = 0;
end
end


