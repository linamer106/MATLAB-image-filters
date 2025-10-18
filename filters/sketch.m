function [sketchImg] = Sketch(ImgArray,intensity)
% The Sketch function takes an image and converts it into a sketch-like
% drawing by using a combination of greyscale, inversion and blurring.
%
% Inputs: 
% ImgArray, an 𝑚-by-𝑛-by-𝑘 uint8 array representing an RGB or greyscale
% colour image. intensity, a positive, odd, integer that defines the
% intensity of the sketch lines (used for blurring).
% Output: 
% sketchImg, an 𝑚-by-𝑛-by-1 uint8 array representing the sketch-like image.
%
% Author: Lina Amer

%pre-allocate a unit8 array for the sketchImg Array using input ImgArray
%width and height values
ImgArraySize=size(ImgArray);
sketchImgSize=ImgArraySize(1:2);
sketchImg=uint8(zeros(sketchImgSize));

% Create a greyscale version of the input image.
GreyscaleImg=Greyscale(ImgArray);

% Create and inverted version of the greyscale image.
InvertGreyImg=Invert(GreyscaleImg);

% Blur the greyscale, inverted image according to the given intensity.
BlurredInvertGreyImg=Blur(InvertGreyImg, intensity);

% Convert the BlurredImg to a double to avoid incorrect calculations( ie.
% rounding prematurely)
BlurredInvertGreyImg=double(BlurredInvertGreyImg);

% Performing a color dodge (ie. blending) between the blurred and the
% original greyscale image on each pixel (row, column) (through looping) in
% the image using the formula: blended (row, column)=(255*front(row,
% column))/ (255*back(row, column)). Where front is the inverted, blurred,
% greyscale image and back is the greyscale of the original image.

for row=1:height(ImgArray)
    for column=1:width(ImgArray)

        % but replace a full white pixel in the back image colour with the
        % maximum (uint8 limit) 255 (to avoid dividing by 0)
        if GreyscaleImg(row,column)==255
            sketchImg(row,column)=uint8(255);
        else
            sketchImg(row, column)= uint8((255* ...
                BlurredInvertGreyImg(row,column))/ ...
                (255-GreyscaleImg(row, column)));
        end
    end
end
end

% % Call function:
% img = imread('strawberry.png');
% sketched = Sketch(img, 3);
% imshow(sketched)