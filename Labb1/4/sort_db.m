Folder = 'C:\Users\Jonathan\Documents\MATLAB\Image_Databse\DIP3E_Original_Images_CH06';
ImgType = '*.tif';
%args are Path to database or folder, what imagetype, size of image and 1
%for collour and 0 for grayscale.
Dbsort = DBsearch(Folder,ImgType,512,512,1);
imshow(Dbsort{1})