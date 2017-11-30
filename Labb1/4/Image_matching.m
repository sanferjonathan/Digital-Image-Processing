Folder = 'C:\Users\Jonathan\Documents\MATLAB\Image_Databse\DIP3E_Original_Images_CH01';
ImgType = '*.tif';

InputImg = im2double(imread('clown.tif'));
ImageData = ReadDB(Folder,ImgType,InputImg);
figure()
subplot(2,2,1)
imshow(InputImg)
title('input image')
subplot(2,2,2)
imshow(ImageData)
title('output image')
subplot(2,2,3)
imhist(InputImg)
title('input image histogram')
subplot(2,2,4)
imhist(ImageData)
title('output image histogram')
