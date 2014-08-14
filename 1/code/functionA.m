
%% Function for Image Shrinking

% Input Parameters
%   Input Image
%   The Shrinking Factor d

% Output Parameters
%   The shrinked image

%%

function [o_image] = functionA(im_image,d)

input_image = imread(im_image);
[rows,cols] = size(input_image);
rowsn = rows/d; % Defining new row and col dimensions
colsn = cols/d;

% output_image = zeros(rowsn,colsn);
i = 1;
j = 1;
while i < rowsn
    j=1;
    while j < colsn
        output_image(i,j) = input_image(i*d,j*d);
        j = j+1;
    end 
     i = i+1;
end
o_image = output_image;
end 