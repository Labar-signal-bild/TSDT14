%% Averaged Periodograms

k = 125; %Antal segment som vi delar upp ACFen i

%
% Calculating Periodograms
%

PSDAv1 = PERIO(y1H,k);
PSDAv2 = PERIO(y2H,k);

%
% Inverstransformering för att få ACFn
%

ACFAv1 = ifft(PSDAv1);
ACFAv2 = ifft(PSDAv2);

%
% Calculating axis lengths
%

NmbrSamples = length(PSDAv1);

thetaVector = 0:1/(NmbrSamples-1):1;

sampleVector = -NmbrSamples/2+1/2:NmbrSamples/2-1/2;

PSDAv1Max1=max(abs(PSDAv1));
PSDAv2Max2=max(abs(PSDAv2));

ACFAv1Max1=max(abs(ACFAv1));
ACFAv2Max2=max(abs(ACFAv2));

%
% Plottar
%

figure(9)
plot(thetaVector,abs(PSDAv1)); 
axis([0 1 -PSDAv1Max1*1.5 PSDAv1Max1*1.5]); 
title('PSD averaging first degree low pass filter'); 
xlabel('theta');
ylabel('Amplitud');

figure(10)
plot(thetaVector,abs(PSDAv2));
axis([0 1 -PSDAv2Max2*1.5 PSDAv2Max2*1.5]);
title('PSD averaging high degree low pass filter');
xlabel('theta');
ylabel('Amplitud');

figure(11)
plot(sampleVector,abs(ACFAv1)); 
axis([-500 500 -ACFAv1Max1*1.5 ACFAv1Max1*1.5]); 
title('ACF averaging first degree low pass filter'); 
xlabel('k');
ylabel('Amplitud');

figure(12)
plot(sampleVector,abs(ACFAv2));
axis([-500 500 -ACFAv2Max2*1.5 ACFAv2Max2*1.5]);
title('ACF averaging high degree low pass filter');
xlabel('k');
ylabel('Amplitud');

saveas(9,'Lab1fig9.svg');
saveas(10,'Lab1fig10.svg');
saveas(11,'Lab1fig11.svg');
saveas(12,'Lab1fig12.svg');