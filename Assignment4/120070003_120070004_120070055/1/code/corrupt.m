
%% Function for corrupting image with gaussian noise

%Input Parameters --> input image  

%Output Parameters --> output image

function [output_image] = corrupt(input_image)
    % Standard deviation=20 
   output_image = input_image + randn(size(input_image))*20;
end