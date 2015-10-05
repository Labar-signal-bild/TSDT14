function xNInverted = inverter(xN)

xNInverted = xN;
for i=1:length(xN);
    xNInverted(i) = xN(length(xN)+1-i);
end
end
