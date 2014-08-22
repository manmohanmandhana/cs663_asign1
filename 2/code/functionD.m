
%% Contrast Limited Adaptive Histogram Equalization

    %Input Parameters: Input Image
    %                  Window Size, N
    %Output Parameters: Output Image
    
%%
    function[output_image] = functionD(im_image,N, e)
     input_image = imread(im_image);   
     [rows,cols] = size(input_image);
        pads = floor((N-1)/2);
        
        for i = 1:rows
            disp(i);            
            rowlow = max(1,i-pads);            
            rowhigh = min(rows,i+pads);
            for j = 1:cols
                collow = max(1,j-pads);              
                colhigh = min(cols,j+pads);               
                frame = [];
                %% we define a matrix which is properly cropped
                ki=1;
                kj=1;
                for ii = rowlow:rowhigh
                    kj = 1;
                    for jj = collow:colhigh
                        frame(ki,kj) = input_image(ii,jj);                        
                        kj = kj+1;
                    end
                    
                    ki = ki+1;
                end
                               
                
                %% Histogram processing on the frame matrix
                P = frame(:); % A frame vector
                size_P = size(frame);
                pix = input_image(i,j); % the pixel value needed
                Phist = hist(P,0:255); % getting the histogram in 256 bins
                Phist = double(Phist/double(size_P(1)*size_P(2)));
                Pmax = max(Phist)*e;
                %disp(Phist);
                len = length(Phist);
                for l = 1:len
                   if Phist(l) > Pmax
                       Extra(l) = Phist(l) - Pmax;
                       Phist(l) = Pmax;
                   end
                end
                avg_extra = mean(Extra);
                Phist(1) = Phist(1) + avg_extra;
                for l = 2:len
                    Phist(l) = Phist(l) + avg_extra;
                    Phist(l) = Phist(l) + Phist(l-1);
                end
	if pix==0
	pix = 1;
	end
                output_image(i,j) = Phist(pix)*255;
                
            end    
        end    
    %out = output_image;
    %end
    output_image = uint8(output_image);
    %figure;
    %imshow(output_image);