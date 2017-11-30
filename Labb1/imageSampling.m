% load color image and display it
Im = imread('mandrill.tif');
% convert it to an intensity image (gray scale)
Im = rgb2gray(Im);
imshow(imrotate(Im,30));
imshow(imrotate(Im,180));
for a = 1:4
    Im = imrotate(Im, 90);
end
imshow(Im);
for b = 1:8
    Im = imrotate(Im, 45);
end
imshow(Im);
for a = 1:36
    imrotate(Im, 10);
end
imshow(Im);
%bilden minskas vid rotation när den hamnar utanför ramen,
%rotationsfunktionen anpassar bilden så den pssar inom ramens gränser