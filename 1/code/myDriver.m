
%% To Display all the images and plots in the question

%% The Shrinked Image

[output11] = functionA('I:\acads\Sem 5\CS663\Assignment1\120070003_120070004\1\images\imageA.png',2);
[output12] = functionA('I:\acads\Sem 5\CS663\Assignment1\120070003_120070004\1\images\imageA.png',3);
figure;
imshow('I:\acads\Sem 5\CS663\Assignment1\120070003_120070004\1\images\imageA.png'); %original
figure;
imshow(output12);
colorbar('location','southoutside');
figure;
imshow(output12);
colorbar('location','southoutside');

%% The Bilinear Interpolation Function

[output2] = functionB('I:\acads\Sem 5\CS663\Assignment1\120070003_120070004\1\images\imageB.png');
figure;
imshow('I:\acads\Sem 5\CS663\Assignment1\120070003_120070004\1\images\imageB.png');
figure;
imshow(output2);
colorbar('location','southoutside');

%%The Nearest Neighbour function

[output3] = functionC('I:\acads\Sem 5\CS663\Assignment1\120070003_120070004\1\images\imageB.png');
figure;
imshow('I:\acads\Sem 5\CS663\Assignment1\120070003_120070004\1\images\imageB.png');
figure;
imshow(output3);
colorbar('location','southoutside');