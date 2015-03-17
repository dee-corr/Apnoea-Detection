cd c:\;
load test1.txt;
x=Treasa1412Test2(1:307,3);
Fs=12.5;
L=length(x);
NFFT = 2^nextpow2(L); % Next power of 2 from length of y
X = fft(x,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);

% Plot single-sided amplitude spectrum.
plot(f,2*abs(X(1:NFFT/2+1))); 
title('Single-Sided Amplitude Spectrum of acceleration x(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')