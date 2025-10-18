function [GreyscaleImgArray] = Greyscale(RGBimgArray)
%The Greyscale function converts the supplied RGB colour image to a
%greyscale version by applying a ratio of colours (r:g:b=3:5:1) for each
%pixel.
%
% Input:
% RGBimgArray, an 𝑚-by-𝑛-by-3 uint8 array representing an RGB colour
% image.
% Output:
% GreyscaleImgArray, an 𝑚-by-𝑛-by-1 uint8 array representing a greyscale
% image.
%
% Author: Lina Amer


%pre-allocate a uint8 array using input array width and height values
RGBimgArraySize=size(RGBimgArray);
GreyScaleArraySize=RGBimgArraySize(1:2);
GreyscaleImgArray=uint8(zeros(GreyScaleArraySize));

%turn RGBimgArray into round to avoid incorrect rounding
RGBimgArray=double(RGBimgArray);

%calculate the grey pixel value for each pixel using the ratio, r:g:b=3:5:1
for row=1:height(RGBimgArray)
    for column=1:width(RGBimgArray)
        GreyscaleImgArray(row,column)=3/9 * RGBimgArray(row, ...
            column, 1) + 5/9 * RGBimgArray(row, column , 2)+1/9 * ...
            RGBimgArray(row, column, 3);
    end
end
end

%To call code:
% %1 pixel image
% img(1,1,1:3) = uint8([250,55,80]);
% grey = Greyscale(img)