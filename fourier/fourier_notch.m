close all
clear all

I = imread('clown2.jpg');

X = im2double(I);


imshow(I,[]);

F = fft2(I);
F2 = fftshift(F);

amplitudes = log(abs(F2)+1);

figure(2)
imshow(amplitudes,[]);


[size_x size_y] = size(I);
 
size_x = size_x +2;
size_y = size_y +2;

F2(172,106) = 0;
F2(173,106) = 0;
F2(173,105) = 0;
F2(172,105) = 0;


F2(size_x-172, size_y - 106) = 0;
F2(size_x-173, size_y - 106) = 0;
F2(size_x-173, size_y - 105) = 0;
F2(size_x-172, size_y - 105) = 0;

F2(136,127) = 0;
F2(size_x-136,size_y-127) = 0;


amplitudes = log(abs(F2)+1);

figure(3)
imshow(amplitudes,[]);

figure(4)
F3 = fftshift(F2);
I2 = ifft2(F3);
imshow(I2,[]);
