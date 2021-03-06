%%
% 1.1 Histogram Computation
% We can see from this histogram that there are alot of dark pixels with
% valoes between 0 and 50 that belongs to the dark foreground. The sea is
% pretty much the middle part vith values between 50 and 200 and the light
% sky is the pixles i the end with values of 250+.
I = (imread('boat.tif'));
H2 = my_hist(I);

figure;
plot(H2)
title('Histogram')
axis tight;

%%
% 1.2 Histogram Equalization
% It is called histogram equalization because you spread out the most
% freaquent intensity values. This allows areas of lower local contrast 
% to gain higher contrast.
I = (imread('boat.tif'));
histogram = imhist(I);
cumulativeHistogram = cumsum(histogram);
EQ = histeq(I,256);
[J,T] = histeq(I);
[im,eq,ch] = my_histeq(I);

figure;
subplot(3,3,1)
imshow(I);
title('Original image')
axis tight;

subplot(3,3,2)
plot(histogram);
title('Original image histogram')
axis tight;

subplot(3,3,3)
plot(cumulativeHistogram);
title('Original cumulative image histogram')
axis tight;

subplot(3,3,4)
imshow(im);
title('enhanced image my histeq')
axis tight;

subplot(3,3,5)
plot(eq);
title('equalized image histogram my histeq')
axis tight;

subplot(3,3,6)
plot(ch);
title('enhanced cumulative image histogram my histeq')
axis tight;

subplot(3,3,7)
imshow(EQ);
title('enhanced image histeq')
axis tight;

subplot(3,3,8)
imhist(EQ);
title('equalized image histogram histeq')
axis tight;

subplot(3,3,9)
plot((0:255)/255,T);
title('enhanced cumulative image histogram histeq')
axis tight;

%%
% 2.1 Convolution Operator
f = im2double(imread('boat.tif'));
gauss_mask3x3 = [0.0625 0.125 0.0625; 0.125 0.25 0.125; 0.0625 0.125 0.0625];

g = my_conv(f, gauss_mask3x3);
g2 = imfilter(f, gauss_mask3x3);
g2 = padarray(g2,[1 1],0);
g3 = imsubtract(g2,g);

figure
subplot(2,2,1)
imshow(g);
title('myconv')

subplot(2,2,2)
imshow(g2);
title('imfilter')

subplot(2,2,3)
imshow(g3);
title('imsubtract')

subplot(2,2,4)
imshow(f);
title('original')
%%
% 2.2 Smoothing Filters
% I general the bigger the filter the more the image get affected by the filter.
% the guassian filter gives a more natural blurr.
f = im2double(imread('clown.tif'));
gauss_mask3x3 = [0.0625 0.125 0.0625; 0.125 0.25 0.125; 0.0625 0.125 0.0625];
gauss_mask5x5 = [0.03125 0.0625 0.125 0.0625 0.03125; 0.0625 0.125 0.25 0.125 0.0625; 0.125 0.25 0.5 0.25 0.125; 0.0625 0.125 0.25 0.125 0.0625; 0.03125 0.0625 0.125 0.0625 0.03125];
mean_mask9x9 = ones(9) * 1/81;
mean_mask5x5 = ones(5) * 1/25;
mean_mask3x3 = ones(3) * 1/9;

n = sum(gauss_mask5x5(:));
gauss_mask5x5 = gauss_mask5x5 * 1/n;

g = my_conv(f, gauss_mask3x3);
g2 = my_conv(f, gauss_mask5x5);
g3 = my_conv(f, gauss_mask3x3);
g4 = my_conv(g3, mean_mask5x5);
g5 = my_conv(g4, mean_mask9x9);

figure;
subplot(3,2,1)
imshow(f);
title('original image')

subplot(3,2,2)
imshow(g);
title('guass3x3 image')

subplot(3,2,3)
imshow(g2);
title('guass5x5 image')

subplot(3,2,4)
imshow(g3);
title('mean mask 3x3 image')

subplot(3,2,5)
imshow(g4);
title('mean mask 5x5 image')

subplot(3,2,6)
imshow(g5);
title('mean mask 9x9 image')

%%
% 2.3 Edge Filters
% laplacian filter is the second derivative of the image. 
% The mask is extreamly sensitive to noise.
% The sobel edge filter have a smoothing effect so they are less
% affected to nois.
f = im2double(imread('clown.tif'));
laplacian_mask3x3 = [-1 -1 -1; -1 8 -1; -1 -1 -1];
sobel_horizontal_edge_mask3x3 = [-1 -2 -1; 0 0 0; 1 2 1];
sobel_vertical_edge_mask3x3 = [-1 0 1; -2 0 2; -1 0 1];
% sobel_edge_mask3x3 = [-2 -2 -2; -2 0 2; 2 2 2];

% g = my_conv(f, sobel_edge_mask3x3);
g = my_conv(f, sobel_horizontal_edge_mask3x3);
g1 = my_conv(g, sobel_vertical_edge_mask3x3);
g2 = my_conv(f, laplacian_mask3x3);
% g3 = my_conv(f, sobel_edge_mask3x3);

figure;
subplot(1,3,1)
imshow(f);
title('original image')

subplot(1,3,2)
imshow(g1);
title('sobel edge mask 3x3 image')

subplot(1,3,3)
imshow(g2);
title('laplacian mask 3x3 image')

%%
% 3.1 Feature Detection
% Strongest feature threshold, To return more blobs, decrease the value of this threshold.
% Higher octaves use larger filters and subsample the image data. 
% Larger number of octaves will result in finding larger size blobs.
% The NumScaleLevels parameter controls the number of filters used per octave.
% I other wrds the number of scale levels per octave to compute.
I = imread('boat.tif');
% detect SURF features
pts = detectSURFFeatures(I,'MetricThreshold',1000.0,'NumOctaves',3,'NumScaleLevels',4);
imshow(I); 
hold on;
% display SURF points
plot(pts.selectStrongest(50)); 
hold off;

%%
% 3.2 Feature Extraction
% extract SURF descriptors
I = imread('boat.tif');
pts = detectSURFFeatures(I,'MetricThreshold',1000.0,'NumOctaves',3,'NumScaleLevels',4);
[feats,validPts] = extractFeatures(I,pts);
%%
% 3.3 Feature Matching
I1 = rgb2gray(imread('graffiti1.png'));
pts = detectSURFFeatures(I1);
[feats1,validPts1] = extractFeatures(I1,pts);

I2 = rgb2gray(imread('graffiti3.png'));
pts2 = detectSURFFeatures(I2);
[feats2,validPts2] = extractFeatures(I2,pts2);

% match feature sets from 2 images
indexPairs = matchFeatures(feats1,feats2);

% visualise matched features
matchedPoints1 = validPts1(indexPairs(:, 1));
matchedPoints2 = validPts2(indexPairs(:, 2));
showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2,'montage')
%%
% 3.4 Image Matching
recognition(4);






