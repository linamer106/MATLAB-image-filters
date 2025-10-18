function [BlurredImg] = Blur(ImgArray, intensity)
% The Blur function blurs the supplied image (RGB or greyscale) by finding
% an average of the pixel colours surrounding each pixel.
%
% Inputs: 
% ImgArray, an 𝑚-by-𝑛-by-𝑘 uint8 array representing an RGB or greyscale
% image. 
% intensity, a positive, odd, integer that defines the intensity of the
% blurring. 
% Output:
% BlurredImg, an 𝑚-by-𝑛-by-𝑘 uint8 array representing the blurred image.
%
% Author: Lina Amer


%pre-allocate a uint8 array for the BlurredImg Array
BlurredImg=uint8(zeros(size(ImgArray)));

% Finding the number of pixels to be added (above, below, and to either
% side) of a P(row, column) to form the square of pixels surrouning pixel
% P(row, column) in the image (the square has a side length of
% 'intensity').
intensityRange=floor(intensity/2);

%looping over every pixel in the ImgArray
for i=1:height(ImgArray)
    for j=1:width(ImgArray)

        %setting variables for vertical and horizontal boundries of the
        %square surrounding each pixel
        rowPixelSquareUpperLimit=i+intensityRange;
        rowPixelSquareLowerLimit=i-intensityRange;
        columnPixelSquareUpperLimit=j+intensityRange;
        columnPixelSquareLowerLimit=j-intensityRange;

        %Setting the condition, for when the square of pixels surrounding
        %the pixel P(i,j) in the image is outside the array vertically, to
        %use the max/min pixel in the row (depending whether it is
        %exceeding the largest/lowest number of rows, respectively).
        rowPixelSquareLowerLimit=max(rowPixelSquareLowerLimit,1);
        rowPixelSquareUpperLimit=min(rowPixelSquareUpperLimit, ...
            height(ImgArray));

        %Setting the condition, for when the square of pixels surrounding
        %the pixel P(i,j) in the image is outside the array horizontally,
        %to use the max/min pixel in the column (depending whether it is
        %exceeding the largest/lowest number of columns, respectively).
        columnPixelSquareLowerLimit=max(columnPixelSquareLowerLimit,1);
        columnPixelSquareUpperLimit=min(width(ImgArray), ...
            columnPixelSquareUpperLimit);

        %finding the square of pixels surrounding P (row, column) with a
        %side length of 'intensity'
        ArraySurroundingPixel=ImgArray(rowPixelSquareLowerLimit: ...
            rowPixelSquareUpperLimit, columnPixelSquareLowerLimit: ...
            columnPixelSquareUpperLimit,:);

        % Calculating the average colour of all pixels within the square’s
        % range (including P(row,column)) using the 'double' function to
        % avpid premature rounding.
        ArraySurroundingPixel=double(ArraySurroundingPixel);
        Average=mean(ArraySurroundingPixel,[1 2]);

        % Round the average colour to the nearest integer.
        Average=round(Average);

        % Place the new averaged colour in pixel position (row,column) of
        % the output image.
        BlurredImg(i,j,:)= Average;
    end
end
end

% %Call function:
% img = imread('strawberry.png');
% blurred = Blur(img, 5);
% imshow(blurred)