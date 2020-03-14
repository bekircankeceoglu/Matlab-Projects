%{
Author: Bekircan Keceoglu
-Soru:3 
- Signal time-frequency analysis
%}
%% ADIM 1
% sampling frequency
fs = 1000;
t = 0:1/1000:2;
y = chirp(t,0,2,100);

plot(y)
title("the sound")
xlabel("t(s)")
ylabel("Amplitude")
xlim([0 2000])

%% ADIM 2
% Fourier synchrosqueezed transform
fsst(y,fs,'yaxis')
xlim([0 1.5])

