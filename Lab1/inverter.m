function xNInverted = inverter(xN)
%INVERTER Min älskade funktion jag skulle aldrig deleta dig inverter!
xNInverted = xN;
for i=1:length(xN);
    xNInverted(i) = xN(length(xN)+1-i);
end
end
