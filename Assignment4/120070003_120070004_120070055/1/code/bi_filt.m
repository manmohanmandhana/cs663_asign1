
%% Function for bilateral filtering

%Input Parameters --> Input Image
%                 --> Window size
%                 --> std deviation of intensity and distance gaussian

%Output Parameters --> Output Image
%                  --> Gaussian Mask 


function [output_image,gaussian] = bi_filt(input_image, sigma_distance, sigma_intensity, n)
[rows,cols] = size(input_image);
output_image = zeros(rows,cols);
w = (n-1)/2;

%% Defining the Gaussian Mask
gaussian = fspecial('gaussian', [n n], sigma_distance);
for i = 1:rows
   for j = 1:cols
         %% Extract local region keeping check on the boundaries
         i_min = max(i-w,1);
         i_max = min(i+w,rows);
         j_min = max(j-w,1);
         j_max = min(j+w,cols);
         % Define the new mask window
         window = input_image(i_min:i_max,j_min:j_max);
         % Compute Gaussian intensity weights.
         intensity_weight = exp(-(window-input_image(i,j)).^2/(2*sigma_intensity^2));
         
         % Calculate the space gaussian
         % w+1 because the coefficients must be positive
         temp = gaussian((i_min:i_max)-i+w+1,(j_min:j_max)-j+w+1);
         
         % Matrix element wise multiplication
         filter_weight = intensity_weight.*temp;
         
         % Normalize and produce the final output
         output_image(i,j) = sum(filter_weight(:).*window(:))/sum(filter_weight(:));
               
   end
end