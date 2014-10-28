
%% Driver function for part 1
tic;
num = 200;
ColorScale = [ [0:1/(num-1):1]' , [0:1/(num-1):1]' , [0:1/(num-1):1]' ];

sigma = 20;
img1 = imread('barbara256.png');
%load('barbara256.mat');
%img1 = imageOrig;
img1 = double(img1);
figure(1);
subplot(2,3,1);
imagesc(img1);
colormap(ColorScale); colormap gray; daspect ([1 1 1]);% axis tight;
colorbar;
axis image;
title('Original Image');
corrupt_image = corrupt(img1);
subplot(2,3,2);
imagesc(corrupt_image);
colormap(ColorScale); colormap gray; daspect ([1 1 1]);% axis tight;
colorbar;
axis image;
title('Corrupt Image');

% Part A of the PCA Denoising
partA_output = PCA_imagedenoising_A(corrupt_image,20);
subplot(2,3,3);
imagesc(partA_output);
colormap(ColorScale); colormap gray; daspect ([1 1 1]);% axis tight;
colorbar;
axis image;
title('Output ImageA');
% Saving the mat file
mse = sum((img1-partA_output).^2);

mse = mse/(256*256);
disp(mean(mse));
%save 'img1' img1out

% Part B of the PCA Denoising
partB_output = PCA_imagedenoising_B(corrupt_image,20);
subplot(2,3,4);
imagesc(partB_output);
colormap(ColorScale); colormap gray; daspect ([1 1 1]);% axis tight;
colorbar;
axis image;
title('Output ImageB');

%Part C the output of the bilateral filtering
[bifilt_output,gaussian_mask] = bi_filt(corrupt_image,1.6,9.6,21);
subplot(2,3,5);
imagesc(bifilt_output);
colormap(ColorScale); colormap gray; daspect ([1 1 1]);% axis tight;
colorbar;
axis image;
title('BilateralFilter Output');
 
toc;