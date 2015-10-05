function ACF = ACF_estimate( y )
%Bartleys ACF estimet

N = length(y);
ACF = zeros(1,N);
for k = -N/2+1:N/2-1
    for n = 1:(N-abs(k))
        ACF(k+N/2) = ACF(k+N/2)+y(n)*y(n+abs(k))./N;
    end
end
end

