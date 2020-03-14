%{
Author: Bekircan Keceoglu
-Question 3- pertrubed_parameter test
%}
%% GOREV 2
% calculate perturbed value 3 times
nominal_deger = 100;
pert_dev      = 10;
for i= 1:3
   perturb_parameter(nominal_deger,pert_dev) 
end