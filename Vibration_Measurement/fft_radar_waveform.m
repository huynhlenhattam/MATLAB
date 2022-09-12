% Author: Huynh Le Nhat Tam
% Date: 12th September 2022
% References: https://www.mathworks.com/help/matlab/ref/fft.html

L = length(X); % X, Y are from the oscilloscope via the Instrument Control Toolbox
% X: time (s), Y: amplitude (V)
Fs = 1000; %sampling frequency: 1000 Hz (This is sampling frequency of the
%oscilloscope
T = 1/Fs;
Yp = preprocess(Y);
Yfft = fft(Yp);
P2 = abs(Yfft/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of the signal')
xlabel('f (Hz)')
ylabel('|P1(f)|')
