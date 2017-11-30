Im = imread('mandrill.tif');
Im = rgb2gray(Im);

n = 8;
I = greyLevelFunc(Im, n);
imshow(I);


 