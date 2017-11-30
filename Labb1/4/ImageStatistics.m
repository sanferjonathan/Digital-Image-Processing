% read in tiff image and convert it to double format
Im = im2double(imread('boat.tif'));
Im2 = im2double(imread('clown.tif'));
Im3 = rgb2gray(im2double(imread('Lena_noisy.jpg')));
Im4 = im2double(imread('lizard_noisy.png'));
Im5 = im2double(imread('mandrill.tif'));
Im6 = rgb2gray(im2double(imread('mandrill.tif')));

%padimg = padarray(Im,[1 1],0);

I = stats(Im6);
Colour = colourstats(Im5);


% display result
figure()
subplot(2,2,1)
imshow(Im6)
title('original image')
subplot(2,2,2)
imshow(I)
title('output image red')
subplot(2,2,3)
imhist(I)
title('output image green')
subplot(2,2,4)
imhist(Colour)
title('output image blue')



