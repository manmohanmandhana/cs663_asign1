
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
        for j=1:cols
            % now around each pixel define a window which can be used for
            % setting the patches that window size is 25
            
            %% Extract local region and the corrosponding window
            i_min = max(i-w1,1);
            i_max = min(i+w1,rows);
            j_min = max(j-w1,1);
            j_max = min(j+w1,cols);
            
            window = input_image(i_min:i_max,j:min:j_max);
            [rowswin,colswin] = size(window);
            
            %% Now apply patching on this window
            
            for ii = 1:rowswin
                for jj = 1:colswin
            
                    % now if the window is on the boundary  then we need to
                    % ignore certain pixels for patch analysis
                    
                    % but we shall get the patches for all and if the
                    % size() < 81 tehn throw it away
                    if i+ii>5 && j+jj>6
                        % this is valid and we do the things otherwise not
                        patch = input_image()
                    end    
                end    
            end    
        end
    end    
end