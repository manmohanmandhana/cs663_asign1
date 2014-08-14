

%% Function for Image Enhancement Using Bilinear Interpolation

% Input Parameters: Input Image
% Output Parameters: Output Image

%%

function[output_image] = functionB(im_image)
    input_image = imread(im_image);
    [M,N] = size(input_image);
    i=0; j=0; 
    while j<(N-1)
        i = 0;
        while i<(M-1)
            k=0;
            while k <3
                output_image(3*i+k+1,2*j+1) = input_image((i+1),(j+1))*(3-k)/3 + input_image((i+2),(j+2))*(k)/3;
                k = k+1;
            end
            i = i+1;
        end
        j = j+1;
    end
    i=0; j=0;
    while j<(N-1)
        i = 0;
           while i<(M-1)
                 output_image(3*i+1,2*j+2) = input_image((i+1),(j+1))/2 + input_image((i+2),(j+2))/2;
                i = i +1;
           end
           j = j+1;
    end
    

           
           
end