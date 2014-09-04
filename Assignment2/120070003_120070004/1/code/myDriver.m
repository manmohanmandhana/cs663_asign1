
%% Driver function for part 1
num = 200;
ColorScale = [ [0:1/(num-1):1]' , [0:1/(num-1):1]' , [0:1/(num-1):1]' ];

load('lionCrop.mat');
img1 = imageOrig;
load('superMoonCrop.mat');
img2 = imageOrig;

img1out = unsharpmasking(img1, 0.5, 0.02);
figure(1);
subplot(1,2,1);
imagesc(img1);
colormap(ColorScale); colormap gray; daspect ([1 1 1]);% axis tight;
colorbar;
axis image;
title('Original Image');
subplot(1,2,2);
imagesc(img1out);
colormap(ColorScale); colormap gray; daspect ([1 1 1]);% axis tight;
colorbar;
axis image;
title('New Image');

img2out = functionA(img2, 0.1, 0.02);
figure(2);
subplot(1,2,1);
imagesc(img2);
colormap(ColorScale); colormap gray; daspect ([1 1 1]); %axis tight;
colorbar;
axis image;
title('Original Image');
subplot(1,2,2);
imagesc(img2out);
colormap(ColorScale); colormap gray; daspect ([1 1 1]);% axis tight;
colorbar;
axis image;
title('New Image');
