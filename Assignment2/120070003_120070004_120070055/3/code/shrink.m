
%% Function for Image Shrinking

% Input Parameters
%   Input Image
%   The Shrinking Factor d

% Output Parameters
%   The shrinked image

%%

function [o_image] = shrink(im_image,d)
[rows,cols] = size(im_image);
rowsn = rows/d ; % Defining new row and col dimensions
colsn = cols/d ;
%output_image = zeros(rowsn,colsn);
i = 1;
j = 1;
for i=1:rowsn
    for j = 1:colsn
        output_image(i,j) = im_image(d*i,d*j); 
    end 
end
o_image = output_image;
end 