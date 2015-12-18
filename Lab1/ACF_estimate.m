function [ACF kA] = ACF_estimate( y )
%Bartleys ACF estimet

ACF = zeros(1,2*N-1);

kA = -floor(nH/2):0.5:floor(nH/2);

for k = -N+1:N-1
    for n = 1:(N-abs(k))
        ACF(k+N) = ACF(k+N)+(y(n).*y(n+abs(k)));
    end
end
ACF = ACF/N;

