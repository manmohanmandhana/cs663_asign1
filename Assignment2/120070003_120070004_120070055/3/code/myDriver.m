
%% The driver function for the second problem
num = 200;
ColorScale = [ [0:1/(num-1):1]' , [0:1/(num-1):1]' , [0:1/(num-1):1]' ];

load('barbara.mat');
img1 = imageOrig;
img2 = shrink(img1,2);
disp(size(img2));
%% Displaying the Bilateral Filtering
img1out1 = corrupt(img2);
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
%[img1out2,gaussian_mask] = patch_filt(img1out1,2.25);
subplot(2,2,3);
imagesc(img1out2);
colormap(ColorScale); colormap gray; daspect ([2 2 2]);% axis tight;
colorbar;
axis image;
title('Filtered Image');
save img1out2;

%% RMSD Computaion

answer = RMSD(img2,img1out2)
