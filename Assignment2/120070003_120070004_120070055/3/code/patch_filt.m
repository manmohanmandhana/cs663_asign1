
%% Code for Patch Based Filtering for edge-preserving smoothing

% Given Parameters: Patch Size = 9x9, window size: 25x25

%Input Parameters --> Input Image
%                 --> The standard deviation of the gaussian

%Output Parameters --> Output Image and the Gaussian Mask for isotropicity
                 
function[output_image,gaussian] = patch_filt(input_image,sigma)
    [rows,cols] = size(input_image);
    output_image = zeros(rows,cols);
    
    win = 25; w1 = 12;
    patch  = 9; w2  = 4;
    
    for i=1:rows
        disp(i);
        for j=1:cols
            % now around each pixel define a window which can be used for
            % setting the patches that window size is 25
            
            %% Extract local region and the corrosponding window
            i_min = max(i-w1,1);
            i_max = min(i+w1,rows);
            j_min = max(j-w1,1);
            j_max = min(j+w1,cols);
            
            window = input_image(i_min:i_max,j_min:j_max);

            % We pad the Window with zeroes
            windowpadded = padarray(window,[4 4]);
           [rowswin,colswin] = size(windowpadded);
           inten = [];
           weight = [];
           gaussian = fspecial('gaussian', [9 9], 1);
            %% Now apply patching on this window
            temppadding = padarray(input_image,[4 4]);
            patchcenter = temppadding(i:i+8,j:j+8);
            k=1;
             for ii = 5:(rowswin -4)
                 for jj = 5:(colswin -4)
         
                    % now if the window is on the boundary  then we need to
                    % ignore certain pixels for patch analysis
                    % We find the euclidian distance between the patches 
                    % and compute the weights by computing their gaussian
                    
                    patch = windowpadded((ii-4):(ii+4),(jj-4):(jj+4));
                    differencevect = norm((patch(:)-patchcenter(:)).*(gaussian(:)))^2;
                    differencevect = differencevect/(sigma^2);
                    
                    weight(k) = exp(-differencevect);
                    inten(k) = weight(k)*windowpadded(ii,jj);
                   
                    k = k+1;
                 end    
             end    
            
             output_image(i,j) = sum(inten)/sum(weight);
%               disp(output_image(i,j));
        end
    end
    
end