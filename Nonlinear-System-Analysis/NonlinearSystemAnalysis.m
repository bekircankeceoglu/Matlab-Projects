%{
Author: Bekircan Keceoglu
-Q:4 
- Nonlinear system, frequency-time analysis
%}
%% ADIM 1
% simulation time
t = 0:1/1000:100;

% ode solver
[tv, dv] = ode45('funcSys', t, [0 1 20]);

%% ADIM 2
% dv1 -> x
% dv2 -> y
% dv3 -> z
% 3d plotting 
p = plot3(dv(:,1), dv(:,2), dv(:,3),'Color','b');
hold on
% starting point
p = plot3(dv(1,1), dv(1,2), dv(1,3),'*','Color','r');
grid on
p.LineWidth = 2;
xlabel('x1')
ylabel('x2')
zlabel('x3')
hold off

%% ADIM 3
Fs = 1000;

for i = 1:3
   FFT_dv(:,i) = fft(dv(:,i));
end
fft_f = linspace(0, Fs, numel(FFT_dv(:,1)));

figure()
% x1 time
subplot(3,2,1)
plot(tv, dv(:,1))
xlabel('t(s)')
ylabel('x1')

% x1 frequency
subplot(3,2,2)
plot(fft_f, abs(FFT_dv(:,1)))
xlabel('Freq(Hz)')
ylabel('x1')
xlim([0 20])

% x2
subplot(3,2,3)
plot(tv, dv(:,2))
xlabel('t(s)')
ylabel('x2')

% x2 frequency
subplot(3,2,4)
plot(fft_f, abs(FFT_dv(:,2)))
xlabel('Freq(Hz)')
ylabel('x2')
xlim([0 20])

% x3
subplot(3,2,5)
plot(tv, dv(:,3))
xlabel('t(s)')
ylabel('x3')

% x3 frequency
subplot(3,2,6)
plot(fft_f, abs(FFT_dv(:,3)))
xlabel('Freq(Hz)')
ylabel('x3')
xlim([0 20])

t = [0 100];

% ode solver
[tv, dv] = ode45('funcSys', t, [0 1 20]);

figure()
% 3d plotting 
plot3(dv(:,1), dv(:,2), dv(:,3),'Color','b');
xlabel('x1')
ylabel('x2')
zlabel('x3')
grid on
hold on

% circle 1 from top
r = 10;
th = 0:pi/50:2*pi;
x = 10;
y = 10;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
zunit = linspace(10, 45, numel(yunit(1,:)));
plot3(xunit, yunit, zunit,'Color','k');

% circle 2 from top
th = 0:pi/50:2*pi;
x = -10;
y = -10;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
zunit = linspace(10, 45, numel(yunit(1,:)));
plot3(xunit, yunit, zunit,'Color','r');
hold off

% state 2d
figure()
subplot(3,1,1)
plot(tv, dv(1,1))
hold on
% center 1: -10 -10 30
% center 2: 10 10 30
% r = 12
rSqr = 144;
for index = 1:numel(dv(:,3))
    result1 = (-10-dv(index,1))^2+(-10-dv(index,2))^2+(30-dv(index,3))^2;
    result2 = (10-dv(index,1))^2+(10-dv(index,2))^2+(30-dv(index,3))^2;
    if(result1 < rSqr)
        subplot(3,1,1)
        plot(tv(index), dv(index,1),'.','Color','r')

    elseif(result2 < rSqr)
        subplot(3,1,1)
        plot(tv(index), dv(index,1),'.','Color','g')

    else
        subplot(3,1,1)
        plot(tv(index), dv(index,1),'.','Color','b')

    end
end
hold off
subplot(3,1,2)
plot(tv, dv(1,2))
hold on
% center 1: -10 -10 30
% center 2: 10 10 30
% r = 12
for index = 1:numel(dv(:,3))
    result1 = (-10-dv(index,1))^2+(-10-dv(index,2))^2+(30-dv(index,3))^2;
    result2 = (10-dv(index,1))^2+(10-dv(index,2))^2+(30-dv(index,3))^2;
    if(result1 < rSqr)
        subplot(3,1,2)
        plot(tv(index), dv(index,2),'.','Color','r')

    elseif(result2 < rSqr)
        subplot(3,1,2)
        plot(tv(index), dv(index,2),'.','Color','g')

    else
        subplot(3,1,2)
        plot(tv(index), dv(index,2),'.','Color','b')

    end
end
hold off
subplot(3,1,3)
plot(tv, dv(1,3))
hold on
% center 1: -10 -10 30
% center 2: 10 10 30
% r = 12
for index = 1:numel(dv(:,3))
    result1 = (-10-dv(index,1))^2+(-10-dv(index,2))^2+(30-dv(index,3))^2;
    result2 = (10-dv(index,1))^2+(10-dv(index,2))^2+(30-dv(index,3))^2;
    if(result1 < rSqr)
        subplot(3,1,3)
        plot(tv(index), dv(index,3),'.','Color','r')

    elseif(result2 < rSqr)
        subplot(3,1,3)
        plot(tv(index), dv(index,3),'.','Color','g')

    else
        subplot(3,1,3)
        plot(tv(index), dv(index,3),'.','Color','b')

    end
end
hold off

% state 3d
figure()
p = plot3(dv(1,1), dv(1,2), dv(1,3),'Color','b');
hold on
% center 1: -10 -10 30
% center 2: 10 10 30
% r = 12
for index = 1:numel(dv(:,3))
    result1 = (-10-dv(index,1))^2+(-10-dv(index,2))^2+(30-dv(index,3))^2;
    result2 = (10-dv(index,1))^2+(10-dv(index,2))^2+(30-dv(index,3))^2;
    if(result1 < rSqr)
        plot3(dv(index,1),dv(index,2),dv(index,3),'.','Color','g');
    elseif(result2 < rSqr)
        plot3(dv(index,1),dv(index,2),dv(index,3),'.','Color','r');
    else
        plot3(dv(index,1),dv(index,2),dv(index,3),'.','Color','b');
    end
end
hold off