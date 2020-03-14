%{
Author: Bekircan Keceoglu
-Soru:2 
- FIR& IIR filter design
%}
%% ADIM 1
% sampling freq
fs = 1024;
% cutoff freq
fc1 = 20;
fc2 = 45;
order60 = fir1(60,[fc1/(fs/2) fc2/(fs/2)],'bandpass');
order90 = fir1(90,[fc1/(fs/2) fc2/(fs/2)],'bandpass');
order120 = fir1(120,[fc1/(fs/2) fc2/(fs/2)],'bandpass');
order150 = fir1(150,[fc1/(fs/2) fc2/(fs/2)],'bandpass');
order180 = fir1(180,[fc1/(fs/2) fc2/(fs/2)],'bandpass');


%% ADIM 2
% inpulse input
impulse_signal = [zeros(1,500), 1, zeros(1,500)];
t = linspace(0, 1, 1001);
subplot(3,2,1)
plot(t, impulse_signal)
title("Impulse Input")
xlabel("t(s)")
ylabel("u(t)")

% inpulse input freq domain
impulse_fft = fft(impulse_signal);
subplot(3,2,2)
plot(abs(impulse_fft))
title("Impulse Input in Freq Domain")
xlabel("f(Hz)")
ylabel("|U(f)|")

% inpulse output
subplot(3,2,3)
out60 = plotFilterOutputs(order60, impulse_signal, t );
out90 = plotFilterOutputs(order90, impulse_signal, t);
out120 = plotFilterOutputs(order120, impulse_signal, t);
out150 = plotFilterOutputs(order150, impulse_signal, t);
out180 = plotFilterOutputs(order180, impulse_signal, t);
legend("60order", "90order", "120order", "150order", "180order")
hold off

% filter output freq domain
subplot(3,2,4)
out60_fft = fft(out60);
plot(abs(out60_fft))
hold on
out90_fft = fft(out90);
plot(abs(out90_fft))
out120_fft = fft(out120);
plot(abs(out120_fft))
out150_fft = fft(out150);
plot(abs(out150_fft))
out180_fft = fft(out180);
plot(abs(out180_fft))
legend("60order", "90order", "120order", "150order", "180order")
title("Impulse Output in Freq Domain")
xlabel("f(Hz)")
ylabel("|Y(f)|")
hold off

% amplitude gain
subplot(3,2,5)
gain60 = out60_fft./impulse_fft;
plot(abs(gain60))
hold on
gain90 = out90_fft./impulse_fft;
plot(abs(gain90))
gain120 = out120_fft./impulse_fft;
plot(abs(gain120))
gain150 = out150_fft./impulse_fft;
plot(abs(gain150))
gain180 = out180_fft./impulse_fft;
plot(abs(gain180))
legend("60order", "90order", "120order", "150order", "180order")
title("Amplitude gain")
xlabel("f(Hz)")
ylabel("|Y(f)/U(f)|")
xlim([0 100])
hold off

% db gain
subplot(3,2,6)
plot(mag2db(abs(gain60)))
hold on
plot(mag2db(abs(gain90)))
plot(mag2db(abs(gain120)))
plot(mag2db(abs(gain150)))
plot(mag2db(abs(gain180)))
legend("60order", "90order", "120order", "150order", "180order")
title("Amplitude gain DB")
xlabel("f(Hz)")
ylabel("|Y(f)/U(f)| DB")
xlim([0 110])

%% ADIM 3
% sampling freq
fs = 1024;
% cutoff freq
fc1 = 20;
fc2 = 45;
order2 = butter(2,[fc1/(fs/2) fc2/(fs/2)],'bandpass');
order3 = butter(3,[fc1/(fs/2) fc2/(fs/2)],'bandpass');
order4 = butter(4,[fc1/(fs/2) fc2/(fs/2)],'bandpass');

%% ADIM 4
% inpulse input
impulse_signal = [zeros(1,500), 1, zeros(1,500)];
t = linspace(0, 1, 1001);
figure()
subplot(3,2,1)
plot(t, impulse_signal)
title("Impulse Input")
xlabel("t(s)")
ylabel("u(t)")

% inpulse input freq domain
impulse_fft = fft(impulse_signal);
subplot(3,2,2)
plot(abs(impulse_fft))
title("Impulse Input in Freq Domain")
xlabel("f(Hz)")
ylabel("|U(f)|")

% inpulse output
subplot(3,2,3)
out2 = plotFilterOutputs(order2, impulse_signal, t );
out3 = plotFilterOutputs(order3, impulse_signal, t);
out4 = plotFilterOutputs(order4, impulse_signal, t);

legend("2order", "3order", "4order")
hold off

% filter output freq domain
subplot(3,2,4)
out2_fft = fft(out2);
plot(abs(out2_fft))
hold on
out3_fft = fft(out3);
plot(abs(out3_fft))
out4_fft = fft(out4);
plot(abs(out4_fft))
legend("2order", "3order", "4order")
title("Impulse Output in Freq Domain")
xlabel("f(Hz)")
ylabel("|Y(f)|")
hold off

% amplitude gain
subplot(3,2,5)
gain2 = out2_fft./impulse_fft;
plot(abs(gain2))
hold on
gain3 = out3_fft./impulse_fft;
plot(abs(gain3))
gain4 = out4_fft./impulse_fft;
plot(abs(gain4))
legend("2order", "3order", "4order")
title("Amplitude gain")
xlabel("f(Hz)")
ylabel("|Y(f)/U(f)|")
xlim([0 1200])
hold off

% db gain
subplot(3,2,6)
plot(mag2db(abs(gain2)))
hold on
plot(mag2db(abs(gain3)))
plot(mag2db(abs(gain4)))
legend("2order", "3order", "4order")
title("Amplitude gain DB")
xlabel("f(Hz)")
ylabel("|Y(f)/U(f)| DB")
xlim([0 110])

function out = plotFilterOutputs(order, impulse_signal, t)

    out = filter(order,1,impulse_signal);

    plot(t, out)
    hold on
    
    
    title("Impulse Output")
    xlabel("t(s)")
    ylabel("y(t)")
end