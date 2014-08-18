
%% Adaptive Histogram Equalization

    %Input Parameters: Input Image
    %                  Window Size, N
    %Output Parameters: Output Image
    
%%
    %function[out] = functionC(im_image,N)
    N=3;
        input_image = imread('I:\acads\Sem 5\CS663\Assignment1\120070003_120070004\2\images\imageA.png');
        [rows,cols] = size(input_image);
        pads = floor((N-1)/2);
        
        for i = 1:rows
            rowlow = max(1,i-pads);
            disp(rowlow);
            rowhigh = min(rows,i+pads);
            disp(rowhigh);
            for j = 1:cols
                collow = max(1,j-pads);
                disp(collow);
                colhigh = min(cols,i+pads);
                disp(colhigh);
                
                %% we define a matrix which is properly cropped
                ki=1;
                kj=1;
                for ii = rowlow:rowhigh
                    kj = 1;
                    for jj = collow:colhigh
                        frame(ki,kj) = input_image(ii,jj);
                        kj = kj+1;
                        disp('bitch');
                    end
                    ki = ki+1;
                end
                frame
                
                %% Histogram processing on the frame matrix
                P = frame(:); % A frame vector
                pix = input_image(i,j); % the pixel value needed
                Phist = hist(P,0:255); % getting the histogram in 256 bins
                ind = find(sort(P) == pix);               % Basically we just want the new intensity corrosponding to the pixel indice(i,j)
                disp(ind);
                Phist = sort(Phist(frame(:)+1));
                len = length(Phist);    
                for l = 2:len
                    Phist(l) = Phist(l) + Phist(l-1);
                end
                minv = Phist(1);
                for l = 1:len
                    k = 255.0/double(Phist(len) - Phist(1));
                    Phist(l) = round(k*double(Phist(l) - minv)); 
                end                   
                %disp(ind);
                output_image(i,j) = Phist(ind);
            end    
        end    
    %out = output_image;
    %end
    