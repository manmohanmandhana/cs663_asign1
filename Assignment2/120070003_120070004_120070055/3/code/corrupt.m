
%% Function for corrupting image with gaussian noise

%Input Parameters --> input image  

%Output Parameters --> output image

function [output_image] = corrupt(input_image)
    % Standard deviation as 5 percent of the intensity range
    variance = 0.05.*(max(max(input_image)) - min(min(input_image)));
    gaussian_noise = variance*randn([size(input_image,1), size(input_image,2)]);
    output_image = gaussian_noise + input_image;
end