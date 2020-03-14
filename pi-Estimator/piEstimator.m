%{
Author: Bekircan Keceoglu
-Question 2-
%}

% number of random vectors
numOfDat = ([1000, 10000, 100000]);

% center values
x = 0;
y = 0;
% radius
r = 1;

for i = 1:3
f = waitbar(0,'Please wait...');    
    
% draw circle with given center values
drawCircle(x,y,r);

% init vector
vector = zeros(2, numOfDat(i));

% create 2 x 1 rand vectors
for j = 1: numOfDat(i)/1000
    for k = 1:1000
         % create vector [-1, 1]
         vector(:,k+(j-1)*1000) = -1+(2)*rand(2,1);

         % calculate length
         % x = vector(1)
         % y = vector(2)
         d(k+(j-1)*1000) = sqrt(vector(1,k+(j-1)*1000)^2 + vector(2,k+(j-1)*1000)^2);
         waitbar((k+(j-1)*1000)/numOfDat(i),f,sprintf('%05f',(k+(j-1)*1000)*100/numOfDat(i)));
    end
end
drawDots(vector, d, numOfDat(i));

end
function h = drawCircle(x,y,r)
% Draw circle 
% Inputs:
%       x : first matrix
%       y : second matrix
%       r : radius
    figure
    hold on
    th = 0:0.1:2*pi;
    xunit = r * cos(th) + x;
    yunit = r * sin(th) + y;
    plot(xunit, yunit,'b');
    drawnow 
end

function h = drawDots(vector, d, numOfDats)
% Draw dots 
% Inputs:
%       vector   : dots indexes
%       d        : vector length
%       numOfDats: total num. of dats
    redDot = 0;
    for i = 1:numOfDats
        if d(i) > 1
            plot(vector(1,i),vector(2,i),'k.');
        else
            plot(vector(1,i),vector(2,i),'r.');
            redDot = redDot + 1;
        end    
    end
    hold off
    % calculate pi number
    piEst = 4 * (redDot / numOfDats);
    title(piEst);
end
