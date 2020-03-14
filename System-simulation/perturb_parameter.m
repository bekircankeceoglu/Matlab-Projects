%{
Author: Bekircan Keceoglu
-Question 3-
%}

%% GOREV 2
function perturbed_value = perturb_parameter(nominal_parameter_value, devPercentege)
    low_limit =  nominal_parameter_value - (nominal_parameter_value * devPercentege/100);
    high_limit=  nominal_parameter_value + (nominal_parameter_value * devPercentege/100);
    
    perturbed_value = low_limit + (high_limit-low_limit)*rand;
end