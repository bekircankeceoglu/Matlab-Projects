%{
Author: Bekircan Keceoglu
-Soru:1 
-Adým:1
- Read audio signal, get sampling frequency and plot signal
%}

% read audio
[y,Fs] = audioread('sound01.wav');

% convert hz to sn
t = linspace(0,2,16000);
x = size(y);
x = x(1,1);
t = t(1:x);

% plot amplitude of signal
plot(t,y)

% print sampling and title
title(strcat("(THE AUDIO DATA) Sampling Frequency:",int2str(Fs)))
xlabel("t(s)")
ylabel("Amplitude")