function [TwoTonedImg] = TwoTone(RGBimgArray, colours, weightings)
%The TwoTone function converts an image to use only two different colours.
%
% Inputs:
%  RGBimgArray, an 𝑚-by-𝑛-by-3 uint8 array representing an RGB image.
%  colours, a 1-by-2-by-3 uint8 array representing two RGB
%   pixel colours to be used in the output image.
%  weightings, a 1-by-2-by-3 uint8 array representing two RGB
%   pixel colours to be used as weightings for determining which output
%   colour to apply.
% Output:
%  TwoTonedImg, an 𝑚-by-𝑛-by-3 uint8 array representing the two toned
%   output image.
%
%Author: Lina Amer


% Pre-allocating an array for the colour difference between the RGBimgArray
% and the high weighting.
RGBimgArraySize=size(RGBimgArray);
ColourDifferenceHighSize=RGBimgArraySize(1:2);
ColourDifferenceHigh=zeros(ColourDifferenceHighSize);

% Pre-allocating an array for the colour difference between the RGBimgArray
% and the low weighting.
ColourDifferenceLow=zeros(ColourDifferenceHighSize);

% Calculating the colour differences for all pixel values for both low and
% high.
for row=1:height(RGBimgArray)
    for column=1:width(RGBimgArray)
        ColourDifferenceLow(row, column)=ColourDifference(RGBimgArray(row, column, :), ...
            weightings(1, 1, :));
        ColourDifferenceHigh(row, column)=ColourDifference(RGBimgArray(row, column, :), ...
            weightings(1, 2, :));
    end
end

% Pre-allocating an array of logical values for when a pixel was closer to
% high.
ArrayLogicalCloserToHigh=zeros(ColourDifferenceHighSize);

% Creating an array of logical values for when a pixel was closer to high.
for row=1:height(RGBimgArray)
    for column=1:width(RGBimgArray)
        ArrayLogicalCloserToHigh(row, column)=false;

        if ColourDifferenceLow(row, column)>ColourDifferenceHigh(row, column)
            ArrayLogicalCloserToHigh(row, column)=true;
        end
    end
end

%Pre-allocating an array of logical values for when a pixel was closer to
% low.
ArrayLogicalCloserToLow=zeros(ColourDifferenceHighSize);

% Creating an array of logical values for when a pixel was closer to low.
for row=1:height(RGBimgArray)
    for column=1:width(RGBimgArray)
        ArrayLogicalCloserToLow(row, column)=false;

        if ColourDifferenceLow(row, column)<=ColourDifferenceHigh(row, column)
            ArrayLogicalCloserToLow(row, column)=true;
        end
    end
end

% Convert the colours input to a double to avoid incorrect calculations
% (ie. rounding prematurely).
colours=double(colours);

% Multiplying the ArrayLogicalCloserToLow and ArrayLogicalCloserToHigh
% arrays by their colours colourA and colourB, respectively, to produce two
% arrays, one with colourA and one with colourB at the correct pixel
% positions.
ArrayColourA=ArrayLogicalCloserToLow .* colours(1, 1, :);
ArrayColourB=ArrayLogicalCloserToHigh .* colours(1, 2, :);

% Combining these arrays to get a final output image.
TwoTonedImg=uint8(ArrayColourA + ArrayColourB);
end

% %Call function:
% colour1(1,1,1:3) = [196 18 48];
% colour2(1,1,1:3) = [90 180 90];
% colours = uint8([colour1, colour2]);

% weighting1(1,1,1:3) = [80 85 90];
% weighting2(1,1,1:3) = [170 95 150];
% weightings = uint8([weighting1, weighting2]);

% img = uint8(rand(50,50,3)*255);

% imshow(TwoTone(img, colours, weightings))

