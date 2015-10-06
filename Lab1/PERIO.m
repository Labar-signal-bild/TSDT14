function PSD = PERIO( y,k )
%PERIO calculates the periodogram esstimate of a PSD

NmbrSamples = length(y);
SamplesPerK = NmbrSamples/k;


yP=zeros(5*SamplesPerK,1);
PSD=zeros(10*SamplesPerK,1);


for i=1:k
    yP(2*SamplesPerK+1:3*SamplesPerK) = y(SamplesPerK*(i-1)+1:SamplesPerK*i);
    yPInv = [inverter(yP) ;0];
    yConv = 1/k*conv(yPInv,yP);
    
    Ry = fft(yConv);
    
    PSD = PSD + Ry;
    
end

PSD = PSD./k;

end
