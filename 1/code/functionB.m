

%% Function for Image Enhancement Using Bilinear Interpolation

% Input Parameters: Input Image
% Output Parameters: Output Image

%%

function[out] = functionB(im_image)
    input_image = imread(im_image);
    figure;
    imshow(input_image);
    [M,N] = size(input_image);         % Defining the size of image  
    Mn = 3*M -2;                       % New Row Number
    Nn = 2*N -1;                       % New Coloumn Number
    
    i=1; 
    j=1;
    
    %% Linear Interpolation for the odd coloumns
   
    while j < Nn
        for i=1:Mn
            if mod((i-1),3) == 0
                output_image(i,j) = input_image((i+2)/3 , (j+1)/2);
            elseif mod((i-1),3) == 1
                output_image(i,j) = (2*(input_image((i+1)/3 , (j+1)/2)) + (input_image((i+4)/3 , (j+1)/2)))/3;
            elseif mod((i-1),3) == 2
                output_image(i,j) = ((input_image((i)/3 , (j+1)/2)) + (input_image((i+3)/3 , (j+1)/2)))/3;
            end
        end
        j = j+2;
    end
    
    %% Filling out the leftover coloumns
    j=2;
    while j<Nn-1
        for i=1:Mn
            output_image(i,j) = output_image(i,j-1) + output_image(i,j+1);
            output_image(i,j) = output_image(i,j)/2;
        end
        j = j+2;
    end    
        
    %% The return output
    out = output_image;
end
