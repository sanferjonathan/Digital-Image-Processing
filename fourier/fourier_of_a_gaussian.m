close all;
clear all;

% Fourier transform of a gaussian?
M = 512;
N = 512;
f = lpfilter('gaussian', M, N, 3);

figure(1);
imshow(fftshift(f),[]); 


F = fft2(f);
figure(2);
imshow(log(1+abs(fftshift(F))),[]);

% Try another sigma...
f = lpfilter('gaussian', M, N, 30);

figure(3);
imshow(fftshift(f),[]); 


F = fft2(f);
figure(4);
imshow(log(1+abs(fftshift(F))),[]);
