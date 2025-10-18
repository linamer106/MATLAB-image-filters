function [CrystallisedImg] = Crystallise(RGBimgArray, crystal_rows, ...
    crystal_columns)
%The Crystallise function applies a frosted window or mosaic-like filter to
%the input image.
%
% Inputs:
%  RGBimgArray, an 𝑚-by-𝑛-by-3 uint8 array representing an RGB image.
%  crystal_rows, a 1-by-𝑛 double array representing the row
%   co-ordinates of each crystal.
%  crystal_columns, a 1-by-𝑛 double array representing the column
%   co-ordinates of each crystal.
% Output:
%  CrystallisedImg, an 𝑚-by-𝑛-by-3 uint8 array representing the
%   crystallised image.
%
% Author: Lina Amer


%pre-allocate a uint8 array for the CrystallisedImg Array
CrystallisedImg=uint8(zeros(size(RGBimgArray)));

% For each pixel (ie. iterating over every pixel in the original image and
% applying the same algorithm), calculate the closest crystal location 
% (by euclidean distance), then replace the pixel colour with the colour 
% that is at the crystal location.
for row=1:height(RGBimgArray)
    for column=1:width(RGBimgArray)
        ClosestPixel=FindClosest([row, column], crystal_rows, ...
            crystal_columns);
        CrystallisedImg(row, column, :)=RGBimgArray(ClosestPixel(1), ...
            ClosestPixel(2), 1:3);
    end
end
end

% %Call function:
% %Project Brief example
% img = imread('Crystallise_example.png');
% crystal_rows =    [3 4 2 5 1];
% crystal_columns = [1 3 4 5 2]; 
% imshow(Crystallise(img,crystal_rows,crystal_columns))