function [InvertedImgArray] = Invert(ImgArray)
% The Invert function converts the supplied image (RGB or greyscale) to its
% opposite colours(complementary hues) and returns the inverted image.
%
% Input: ImgArray, an 𝑚-by-𝑛-by-𝑘 uint8 array representing an RGB or
% greyscale colour image.
% Output: InvertedImgArray, an 𝑚-by-𝑛-by-𝑘 uint8 array representing the
% inverted image.
%
% Author: Lina Amer

%calculate the opposite colour for each pixel in the image
InvertedImgArray=255-ImgArray;

end

% % Call function:
% img = uint8(rand(50,50,3)*255);
% inverted = Invert(img);
% imshow(inverted)