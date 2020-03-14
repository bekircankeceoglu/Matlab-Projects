%{
Author: Bekircan Keceoglu
-Question 3-
%}
%% GOREV 1

x0 = [1; 0.8; 0.1; 0.4];
tspan = linspace(1,500,500);
[t,x] = ode45(@gorev1, tspan, x0);

subplot(4,1,1);
plot(x(:,1));
title('GOREV 1')
ylabel('x1')
xlabel('t(s)')

subplot(4,1,2);
plot(x(:,2));
ylabel('v1')
xlabel('t(s)')

subplot(4,1,3);
plot(x(:,3));
ylabel('x2')
xlabel('t(s)')

subplot(4,1,4);
plot(x(:,4));
ylabel('v2')
xlabel('t(s)')

%% GOREV 3
colors= 'kbgry';
figure();
% 5 loop
for i=1:1:5
    x0 = [1; 0.8; 0.1; 0.4];
    tspan = linspace(1,500,500);
    [t,x] = ode45(@gorev3, tspan, x0);

    subplot(4,1,1);
    plot(x(:,1),'Color',colors(i));
    title('GOREV 3')
    ylabel('x1')
    xlabel('t(s)')
    hold on

    subplot(4,1,2);
    plot(x(:,2),'Color',colors(i));
    ylabel('v1')
    xlabel('t(s)')
    hold on
    
    subplot(4,1,3);
    plot(x(:,3),'Color',colors(i));
    ylabel('x2')
    xlabel('t(s)')
    hold on
    
    subplot(4,1,4);
    plot(x(:,4),'Color',colors(i));
    ylabel('v2')
    xlabel('t(s)')
    hold on
end
hold off
%% Functions
function xprime = gorev1(t, x);
M1 = 300;  % kg
M2 = 2500; % kg
F  = 1000; % N
Ks = 1000; % Nm
Kd1= 5000; % Ns/m
Kd2= 2000; % Ns/m

% x(1)=x1, x(2)=v1, x(3)=x2, x(4)=v2
xprime = [
    1*x(2);
    (-Ks/M1)*x(1)+(-Kd1/M1)*x(2)+(Ks/M1)*x(3)+(Kd1/M1)*x(4)+(F/M1);
    1*x(4);
    (Ks/M2)*x(1)+(Kd2/M2)*x(2)+(-2*Ks/M2)*x(3)+(-Kd2/M2)*x(4)
    ];
end

function xprime = gorev3(t, x);
M1 = perturb_parameter(300,10);  % kg
M2 = perturb_parameter(2500,10); % kg
F  = 1000; % N
Ks = perturb_parameter(1000,10); % Nm
Kd1= perturb_parameter(5000,10); % Ns/m
Kd2= perturb_parameter(2000,10); % Ns/m

% x(1)=x1, x(2)=v1, x(3)=x2, x(4)=v2
xprime = [
    1*x(2);
    (-Ks/M1)*x(1)+(-Kd1/M1)*x(2)+(Ks/M1)*x(3)+(Kd1/M1)*x(4)+(F/M1);
    1*x(4);
    (Ks/M2)*x(1)+(Kd2/M2)*x(2)+(-2*Ks/M2)*x(3)+(-Kd2/M2)*x(4)
    ];
end