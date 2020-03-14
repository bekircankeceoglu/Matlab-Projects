%{
Author: Bekircan Keceoglu
-Question 1-
Manhattan Distance
%}


function cost = ManhattanDistance(A,B)
% ManhattanDistance.m calculates manhattan dist. of A and B matrixes
% Inputs:
%       A : first matrix
%       B : second matrix
% Outputs:
%       cost: distance of matrixes
    % find dimension of input matrix
    [numRows, numCols]= size(B);
    
    cost = 0;
    
    for bNumRow = 1:numRows
        for bNumCol = 1:numCols
            % iterate through B matrix
            b_matrixVal = B(bNumRow,bNumCol);
            
            % get linear index of b_matrixVal inside A matrix
            a_matrixLinIndex = find(A==b_matrixVal,1,'last');
            
            % get subscripts of b_matrixVal inside A matrix
            [aNumRow, aNumCol] = ind2sub(size(B), a_matrixLinIndex);
            
            % calculate cost
            cost = cost + (abs(bNumRow - aNumRow)+abs(bNumCol - aNumCol));
        end
    end
end