
%% Linear Contrast Streching Function

    % Input Parameters: Input Image
    % Output Parameters: Output Image
    
%%

function[out] = functionA(im_image)
    input_image = imread(im_image);
    [rows,cols] = size(input_image);
   
    xmax = max(input_image(:));   
    xmin = min(input_image(:));   
    m = double(double(255)/double(xmax - xmin));    
    c = double(xmin*m);
  
    i=1;
    j=1;
    
    for i=1:rows
        for j=1:cols
            output_image(i,j) = m*(input_image(i,j)) + c;
        end
    end
    out = output_image;
end