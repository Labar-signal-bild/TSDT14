%% Averaged Periodograms

kAvS = 72; %Antal segment som vi delar upp ACFen i
kAvH = 120;
kAvA = 100;
%
% Calculating Periodograms
%

PSDAvS = PERIO(yS1,kAvS);
PSDAvH = PERIO(yH1,kAvH);
PSDAvA = PERIO(yA1,kAvA);


%
% Calculating axis lengths
%

nAvS = length(PSDAvS);
kAvS = -nAvS/2+1/2:nAvS/2-1/2;
thetaAvS = 0:1/(nAvS-1):1;

nAvH = length(PSDAvH);
kAvH = -nAvH/2+1/2:nAvH/2-1/2;
thetaAvH = 0:1/(nAvH-1):1;

nAvA = length(PSDAvA);
kAvA = -nAv/2+1/2:nAvA/2-1/2;
thetaAvA = 0:1/(nAvA-1):1;

PSDAvMaxS = max(abs(PSDAvS));
PSDAvMaxH = max(abs(PSDAvH));
PSDAvMaxA = max(abs(PSDAvA));
