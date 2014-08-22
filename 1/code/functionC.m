
%% Function for Image Enlargement

% Input Parameters
%   Input Image

% Output Parameters
%   The enlarged image

%%

function [o_image] = functionC(im_image)

input_image = imread(im_image);
cols = length(input_image(1,:));
rows = length(input_image(:,1));
rowsn =(3*rows) - 2; % Defining new row and col dimensions
colsn =(2*cols)- 1;

temp(1:3:rowsn , 1:2:colsn) = input_image;

for i=1:cols-1
    for j = 1:rows-1
        temp((3*j)-1,(2*i)-1)=temp((3*j)-2 , (2*i)-1);
        temp((3*j),(2*i)-1)=temp((3*j)+1 , (2*i)-1);
        temp((3*j)-2,(2*i))=temp((3*j)-2 , (2*i)-1);
        temp((3*j)-1,(2*i))=temp((3*j)-2 , (2*i)-1);
        temp((3*j),(2*i))=temp((3*j)+1 , (2*i)-1);
    end
end

%last row and last column added separately
for l=1:rows-1
    temp((3*l)-1,(2*cols)-1)=temp((3*l)-2 , (2*cols)-1);
    temp((3*l),(2*cols)-1)=temp((3*l)+1 , (2*cols)-1);
end

for m = 1:cols-1
    temp((3*rows)-2,(2*m))=temp((3*rows)-2 , (2*m)-1);
end
    
o_image = temp;

end 





