
%% Function for Image Sharpening by PCA 
% PART A
%Input Parameters --> Input Image
%                 --> Std. Deviation of the noise sigma


%Output: Image

function [ out ] = PCA_imagedenoising_A(input_image,sigma)
% creating a patch of 7x7 elements
  [rows,cols] = size(input_image);
  patch = input_image(1:7,1:7);
  p = patch(:);
  disp(size(p));
  out = zeros(rows,cols);
  for i=1:(rows-6)
      for j=2:(cols-6)
          patch = input_image(i:i+6,j:j+6);
          p = horzcat(p,patch(:));
      end
  end
  
  % compute the eigen vector matrix of pp^
  imgvecnew = p*transpose(p);
  [V,D] = eig(imgvecnew);
  % Normalize
  norms = sqrt(sum(V.^2));
  V = V ./ kron(norms, ones([7*7 1]));
    
  alpha = transpose(V)*p;
  
  % to find alpha j bar
  alphabar = transpose(sum(transpose(alpha.^2)))/(size(p,2));
  alphabar = max(0,alphabar-400);
  % now we find the alpha denoised
  alphanew = alpha;
  for k=1:size(p,1)
      alphanew(k,:) = alpha(k,:)/(1+((sigma*sigma))/(alphabar(k)));
  end
  
  %reconstruct
  alphanew1 = V*alphanew;
  % now we need to reconstruct these patches and put them in the output
  % image with correct weights
 
  count  =1;
  newpatch = patch;
  weight = 1;
  for i=1:(rows-6)
      for j=1:(cols-6)
        newpatch = vec2mat(alphanew1(:,count),7);
        newpatch = transpose(newpatch);
        if(i~=rows-6 && j~=cols-6)
        count = count+1;
        end
        for ii=i:i+6
            for jj=j:j+6
                l = [49,(ii*jj),(cols-jj+1)*(rows-ii+1)];
                weight = min(l);
                out(ii,jj) = out(ii,jj)+ (newpatch(ii-i+1,jj-j+1)/weight);
            end
        end    
      end
  end
  
  % mean squared error between input and output
  
end

