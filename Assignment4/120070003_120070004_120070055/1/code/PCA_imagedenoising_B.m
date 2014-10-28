
%% Function for Image Sharpening by PCA 
% PART B
%Input Parameters --> Input Image
%                 --> Std. Deviation of the noise sigma


%Output: Image

function[out] = PCA_imagedenoising_B(input_image,sigma)
%creating 7x7 patches and saving it in a matrix
  [rows,cols] = size(input_image);
  out = zeros(rows,cols);
    
  outputImage = double(zeros(rows,cols));
  outputMask = double(zeros(rows,cols));

for i=1:rows-6
    for j=1:cols-6
        
        % Generate the subimage
        subPatch = reshape(input_image(i:i+6, j:j+6), 49, 1);
        
        xMin = max(i-15,1);
        xMax = min(i+15-6,rows-6);
        yMin = max(j-15,1);
        yMax = min(j+15-6,cols-6);
        
        patches = zeros([49 (xMax-xMin+1)*(yMax-yMin+1)]);
        rmsds = zeros([1 (xMax-xMin+1)*(yMax-yMin+1)]);
        
        for k=xMin:xMax
            for l=yMin:yMax
                
                patch = reshape(input_image(k:k+6, l:l+6), 49, 1);
                rmsd = sqrt(sum((patch-subPatch).^2));
                patches(:, (xMax-xMin+1)*(k-xMin+1)-(xMax-xMin+1)+(l-yMin+1)) = patch;
                rmsds((xMax-xMin+1)*(k-xMin+1)-(xMax-xMin+1)+(l-yMin+1)) = rmsd;
                
            end
        end
        
        [sortedRmsd,sortOrder]=sort(rmsds, 'ascend');
        sortedPatches = patches(:, sortOrder);
        sortedPatchesSize = size(sortedPatches);
        selectedPatches = sortedPatches(:, 1:min(250, sortedPatchesSize(2)));
        
        % Get eigenvectors
        imgnew = selectedPatches*transpose(selectedPatches);
        [V,D] = eig(imgnew);

        % Normalize
        norms = sqrt(sum(V.^2));
        V = V ./ kron(norms, ones([7*7 1]));

        % Get coefficients
        coeffs = transpose(V)*selectedPatches;

        % Get estimates of original coefficients
        alphabar = transpose(sum(transpose(coeffs.^2)))/min(250, sortedPatchesSize(2));
        alphabar  = max(0, alphabar-sigma^2);

        % Modify coefficients
        alphanew = coeffs ./ (1 + 20./ kron(alphabar, ones([1 min(250, sortedPatchesSize(2))])));
        newpatch = V*alphanew(:, 1);
        
        outputImage(i:i+6, j:j+6) = outputImage(i:i+6, j:j+6) + reshape(newpatch, 7, 7);
        outputMask(i:i+6, j:j+6) = outputMask(i:i+6, j:j+6) + 1;
        
    end
end

out = outputImage./outputMask;

end