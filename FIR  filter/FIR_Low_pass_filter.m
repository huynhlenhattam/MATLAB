%This program is a modification of the program from the Website: https://www.mathworks.com/matlabcentral/answers/309388-generate-single-cycle-of-a-sine-wave-at-a-particular-frequency
%Digital Signal Processing lab
%Student's name: Huynh Le Nhat Tam
%VGU Student ID: 14506
fs = 48000; % Sampling frequency (samples per second) 
 dt = 1/fs; % seconds per sample 
 %t = (0:dt:StopTime)'; % seconds 
 tt = 0:dt:0.01 ;
 y = sin(2*pi*3000.*tt) + sin(2*pi*9000.*tt) ;
 yf = filter(b,1,y);%b is the coefficient exported from FIR_Low_pass_filter.fda
 plot(tt,y,'r') ; hold on; plot(tt,yf,'b');
 legend('raw mixed signal','filtered signal');
