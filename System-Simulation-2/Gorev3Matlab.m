%{
Author: Bekircan Keceoglu
-Question 4-
%}
%% GOREV 3
% Simulink to matlab data test
% Run simulink simulation before this section
figure();
plot(out.x1(1,1),out.x2(1,1),'r*');
hold on
plot(out.x1(:,1),out.x2(:,1),'b');
hold off
grid on
title("GOREV3-Simulink Data");
ylabel('x2(t)')
xlabel('x1(t)')