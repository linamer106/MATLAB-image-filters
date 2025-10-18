function [differenceArray] = ColourDifference(ColourArrayOne, ...
    ColourArrayTwo)
% The ColourDifference function, given two 𝑚-by-𝑛-by-3 arrays, will
% calculate the euclidean difference in colour between respective pixels in
% the two arrays.
%
% Inputs:
% ColourArrayOne, an 𝑚-by-𝑛-by-3 uint8 array representing one array of
% colours.
% ColourArrayTwo, an 𝑚-by-𝑛-by-3 uint8 array representing a second array
% of colours.
% Output:
% difference, an 𝑚-by-𝑛 array of doubles representing the euclidean
% difference in colour between corresponding pixels of the inputs.
%
%Author: Lina Amer


%pre-allocate a unit8 array for the differenceArray using input
%ColourArrayOne and ColourArrayTwo width and height values
ColourArrayOneSize=size(ColourArrayOne);
differenceArraySize=ColourArrayOneSize(1:2);
differenceArray=zeros(differenceArraySize);

% Convert the ColourArrayOne and ColourArrayTwo inputs to a double to avoid
% incorrect calculations( ie. rounding prematurely)
ColourArrayOne=double(ColourArrayOne);
ColourArrayTwo=double(ColourArrayTwo);

% Calculating the difference between the colour of two pixels (in
% equivalent positions in ColourArrayOne and ColourArrayTwo) using the
% euclidean distance (ie. Pythagorean distance). 
% Given a pixel 𝑝 with colours ( 𝑝𝑟 , 𝑝𝑔, 𝑝𝑏) and a pixel 𝑞 with
% colours (𝑞𝑟, 𝑞𝑔, 𝑞𝑏), the euclidean distance between the two
% colours can be calculated by: 𝑑(𝑝, 𝑞) = sqrt ((𝑞𝑟 − 𝑝𝑟)^2 + (𝑞𝑔
% − 𝑝𝑔)^2 + (𝑞𝑏 − 𝑝𝑏)^2).
%This will be done to every pixel in both array hence looping and since
%both arrays are of the same size, so using the height and width of either
%would give equivalent results.
for row=1:height(ColourArrayOne)
    for column=1:width(ColourArrayOne)
        differenceArray(row, column)=sqrt((ColourArrayOne(row, column, 1) - ...
            ColourArrayTwo(row, column, 1))^2 + (ColourArrayOne(row, column, 2)- ...
            ColourArrayTwo(row, column, 2))^2 + (ColourArrayOne(row, column, 3)- ...
            ColourArrayTwo(row, column, 3))^2);
    end
end

end

% %Call function:
% colour1(1,1,1:3) = uint8([206, 230, 78]);
% colour2(1,1,1:3) = uint8([16, 196, 170]);
% ColourDifference(colour1, colour2)