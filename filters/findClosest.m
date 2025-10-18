function [closestPixelCoordinate] = FindClosest(pixelPosition, ...
    rowCoordinatesArray, columnCoordinatesArray)
% The FindClosest function, given a pixel position, finds the closest pixel
% from the given row and column co-ordinates. 
% 
% Inputs: 
% pixelPosition, a 1-by-2 double vector representing the position of a
% pixel.
% rowCoordinatesArray, 1-by-𝑛 double array representing the row
% co-ordinates of a set of pixels.
% columnCoordinatesArray, a 1-by-𝑛 double array representing the column
% co-ordinates of a set of pixels.
% Output: 
% closestPixelCoordinate, a 1-by-2 double vector representing the position
% of the closest pixel co-ordinates to the input position.
%
% Author: Lina Amer


%pre-allocate an array for the pixelDifference array, which measures how
%far each input pixel (using its respective row and column position from
%the row and column arrays) is from the pixelPosition, using input
%rowCoordinatesArray width values.
pixelDifference=zeros(1, width(rowCoordinatesArray));

%The distance between pixels should be calculated as their euclidean
%distance from one another. Given a point 𝑝 with co-ordinates ( 𝑝1, 𝑝2) and 
% a point 𝑞 with co-ordinates (𝑞1, 𝑞2), the distance can be calculated by:
% d(p, q) = sqrt((𝑞1 − 𝑝1)^2 + (𝑞2 − 𝑝2)^2).
%                                           
for column=1:width(rowCoordinatesArray)
        pixelDifference(1, column)=sqrt((pixelPosition(1) - ...
            rowCoordinatesArray(column))^2+(pixelPosition(2) - ...
            columnCoordinatesArray(column))^2);
end

%find the lowest pixelDifference value of the smallest distance between the
%input pixelPosition and the pixels in the input arrays
leastDistance=min(pixelDifference);

%find the index of that smallest value
PixelCoordinateIndicesColumns=1;
for column=1:width(pixelDifference)
    if pixelDifference(column)==leastDistance
        PixelCoordinateIndices(PixelCoordinateIndicesColumns)=column;
        PixelCoordinateIndicesColumns=PixelCoordinateIndicesColumns+1;
    end
end

% If there are pixel locations that are equidistant to our input pixel, the
% function should prioritise the row, column pair that has the lowest index
% in the input arrays, ie. use the smallest index value. 
PixelCoordinateIndex=min(PixelCoordinateIndices);

%use that index in the original column and row array to find the values 
closestPixelCoordinate=[rowCoordinatesArray(PixelCoordinateIndex ...
    ), columnCoordinatesArray(PixelCoordinateIndex)];
end