
%% The driver function for the second problem
num = 200;
ColorScale = [ [0:1/(num-1):1]' , [0:1/(num-1):1]' , [0:1/(num-1):1]' ];

load('barbara.mat');
img1 = imageOrig;

%% Displaying the Bilateral Filtering
img1out1 = corrupt(img1);
[img1out2,gaussian_mask] = bi_filt(img1out1,10,5,21);
figure(1);
subplot(2,2,1);
imagesc(img1);
colormap(ColorScale); colormap gray; daspect ([2 2 2]);% axis tight;
colorbar;
axis image;
title('Original Image');
subplot(2,2,2);
imagesc(img1out1);
colormap(ColorScale); colormap gray; daspect ([2 2 2]);% axis tight;
colorbar;
axis image;
title('Corrupted Image');
subplot(2,2,3);
imagesc(img1out2);
colormap(ColorScale); colormap gray; daspect ([2 2 2]);% axis tight;
colorbar;
axis image;
title('Filtered Image');
subplot(2,2,4);
imagesc(gaussian_mask);
colormap(ColorScale); colormap gray; daspect ([2 2 2]);% axis tight;
colorbar;
axis image;
title('Gaussian Mask');

%% RMSD Computaion

answer = RMSD(img1,img1out2)
