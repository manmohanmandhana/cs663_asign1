
%% The code for calling all the outputs of the question

%% Part A: Linear Contrast Streching

[output11] = functionA('I:\acads\Sem 5\CS663\Assignment1\120070003_120070004\2\images\imageA.png'); % Image 1
[output21] = functionA('I:\acads\Sem 5\CS663\Assignment1\120070003_120070004\2\images\imageB.png'); % Image 1
figure;
imshow('I:\acads\Sem 5\CS663\Assignment1\120070003_120070004\2\images\imageA.png');     % The original Image
figure;
imshow('I:\acads\Sem 5\CS663\Assignment1\120070003_120070004\2\images\imageB.png');     % The original Image
figure;
imshow(output11);                                                                        % The output Image
figure;
imshow(output21);

%% Part B: Histogram Equalization


[output12] = functionB('I:\acads\Sem 5\CS663\Assignment1\120070003_120070004\2\images\imageA.png'); % Image 1
[output22] = functionB('I:\acads\Sem 5\CS663\Assignment1\120070003_120070004\2\images\imageB.png'); % Image 1
figure;
imshow('I:\acads\Sem 5\CS663\Assignment1\120070003_120070004\2\images\imageA.png');     % The original Image
figure;
imshow('I:\acads\Sem 5\CS663\Assignment1\120070003_120070004\2\images\imageB.png');     % The original Image
figure;
imshow(output12);                                                                        % The output Image
figure;
imshow(output22);   

%% Part C: Adaptive Histogram Equalization


[output13] = functionC('I:\acads\Sem 5\CS663\Assignment1\120070003_120070004\2\images\imageA.png',131); % Image 1
[output23] = functionC('I:\acads\Sem 5\CS663\Assignment1\120070003_120070004\2\images\imageB.png',131); % Image 2
figure;
imshow('I:\acads\Sem 5\CS663\Assignment1\120070003_120070004\2\images\imageA.png');     % The original Image
figure;
imshow('I:\acads\Sem 5\CS663\Assignment1\120070003_120070004\2\images\imageB.png');     % The original Image
figure;
imshow(output13);                                                                        % The output Image
figure;
imshow(output14);

%% Part D: Contrast Limited Adaptive Histogram Equalization

[output14] = functionD('I:\acads\Sem 5\CS663\Assignment1\120070003_120070004\2\images\imageA.png',100,0.30); % Image 1
[output24] = functionD('I:\acads\Sem 5\CS663\Assignment1\120070003_120070004\2\images\imageB.png',100,0.30); % Image 2
[output14half] = functionD('I:\acads\Sem 5\CS663\Assignment1\120070003_120070004\2\images\imageA.png',100,0.15); % Image 1 half threshold
[output24half] = functionD('I:\acads\Sem 5\CS663\Assignment1\120070003_120070004\2\images\imageB.png',100,0.15); % Image 2

figure;
imshow('I:\acads\Sem 5\CS663\Assignment1\120070003_120070004\2\images\imageA.png');     % The original Image
figure;
imshow('I:\acads\Sem 5\CS663\Assignment1\120070003_120070004\2\images\imageB.png');     % The original Image
figure;
imshow(output14);                                                                        % The output Image
figure;
imshow(output24);
figure;
imshow(output14half);                                                                        % The output Image
figure;
imshow(output24half);