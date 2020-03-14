%{
Author: Bekircan Keceoglu
-Q:4 
- Nonlinear system frequency time analysis
%}
% Inputs:
% t - time variable
% input - 3 dimensional input
% Outputs:
% d - 3 dimensional derivatives of inputs
function d = funcSys(t,input)
    sigma = 10;
    rho   = 28;
    beta  = 8 / 3;
    d(1,1) = sigma*(input(2)-input(1));
    d(2,1) = input(1)*(rho-input(3))-input(2);
    d(3,1) = input(1)*input(2) - beta*input(3);
end