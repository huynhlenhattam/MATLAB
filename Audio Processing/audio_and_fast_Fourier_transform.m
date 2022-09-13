%References: https://www.mathworks.com/help/matlab/ref/fft.html and https://www.mathworks.com/help/matlab/ref/audiorecorder.html
%Author: Huynh Le Nhat Tam
Fs = 48000 ; 
nBits = 16 ; 
nChannels = 2 ; %stereo sound (nChannels = 1 for mono sound)
recObj = audiorecorder(Fs,nBits,nChannels);
disp('Start speaking.')
recordblocking(recObj,7);%duration of the recording (seconds)
disp('End of Recording.');
%play(recObj);
y = getaudiodata(recObj);
z = fft(y);
L = 580;
P2 = abs(z/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
plot(f,P1) ;
xlabel('f (Hz)') 
ylabel('|P1(f)|')
