
%% Function for Histogram Equalisation

% Input Parameters
%   Input Image

% Output Parameters
%   The equasiled image

%%

function [o_image] = functionE(im_image)

input_image = imread(im_image);
cols = length(input_image(1,:));
rows = length(input_image(:,1));

%No. of pixels per intensity 
pdf(1:256,1)= 0:255;
pdf(:,2)=0;
for i = 1:(rows)
    for j=1:cols
    pdf((input_image(i,j)+1),2)= pdf((input_image(i,j)+1),2)+1;
    end 
end

%Cummulative distribution of pixels 
cdf(1:256,1)=0:255;
cdf(1,2)=pdf(1,2);
for k = 2:256
    cdf(k,2)=cdf(k-1,2)+pdf(k,2);
end

%rounding the equalised cummulative distribution probability
cdf (:,2)= round((cdf(:,2)/(rows*cols))*255);

%mapping back the equalised intensity values
out=input_image;
for i = 1:(rows)
    for j=1:cols
    out(i,j)= cdf((input_image(i,j)+1),2);
    end 
end

imshow(out);
o_image=out;
end
    