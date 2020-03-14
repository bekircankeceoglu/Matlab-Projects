%{
Author: Bekircan Keceoglu
-Question 4-
%}

%% GOREV 1
% initial condition
x0 = [1; 1];
tspan = linspace(1,10,100);
[t,x] = ode45(@gorev1, tspan, x0);

plot(x(1,1),x(1,2),'r*');
hold on
plot(x(:,1),x(:,2),'b');
grid on
title('GOREV 1')
ylabel('x2(t)')
xlabel('x1(t)')

%% GOREV 2
%a) c = 0.5   T = 10
c = 0.5;
x = sqrt(c/1.5);
x = x - 0.01;
x0 = linspace(-x,x,100);
tspan = linspace(1,10,100);

gorev2(tspan,x0,c);

%b) c = 1.5  T = 10
c = 1.5;
x = sqrt(c/1.5);
x = x - 0.01;
x0 = linspace(-x,x,100);
tspan = linspace(1,10,100);

gorev2(tspan,x0,c);

%c) c = 2.25  T = 10
c = 2.25;
x = sqrt(c/1.5);
x = x - 0.01;
x0 = linspace(-x,x,100);
tspan = linspace(1,10,100);

gorev2(tspan,x0,c);

%d) c = 3     T = 2.6
c = 3;
x = sqrt(c/1.5);
x = x - 0.01;
x0 = linspace(-x,x,100);
tspan = linspace(1,2.6,100);

gorev2(tspan,x0,c);



%% Functions
function xprime = gorev1(t, x);
% Gorev 1: given system
% Inputs:
%       x   : initial condition
%       d   : interval of integral
xprime = [
    -1*x(2);
    1*x(1)+(x(1)*x(1)-1)*x(2)
    ];
end

function xprime = gorev2(tspan, x0, c);
% Gorev 2: 
% Inputs:
%       x   : initial condition
%       d   : interval of integral
%       c   : limit
    figure
    for i = 1:100
        [t,x] = ode45(@gorev1, tspan, [x0(i); x0(i)]);

        plot(x(1,1),x(1,2),'r*');
        hold on
        plot(x(:,1),x(:,2),'b');
        grid on
    end
    hold off
    title(strcat('V(x)<',num2str(c)))
    ylabel('x2(t)')
    xlabel('x1(t)')
end