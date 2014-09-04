
%% Function for Image Sharpening by Unsharp Mask

%Input Parameters --> Input Image
%                 --> Gaussian Parameter  
%                 --> Scaling Factor

%Output: Image

function [ out ] = unsharpmasking(input_image,sigma,s)
    %% First perform the gaussian filtering
    gauss= fspecial('gaussian', [3 3], sigma);
    blurred_image = imfilter(input_image, gauss);
    %% inversion
    inverted_blurred_image = 1 - blurred_image;
    %% scaling
    scaled_inverted_blurred_image = s*inverted_blurred_image;
    output_image = input_image + scaled_inverted_blurred_image;
    
    out = output_image;
end

