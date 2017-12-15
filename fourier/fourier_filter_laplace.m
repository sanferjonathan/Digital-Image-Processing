close all;
clear all;

% The contrast in the clown.tif image is already quite good...
I = imread('clown.tif');
f = im2double(I);
figure(1)
imshow(f,[]); [M N] = size(f);
F = fft2(f);
figure(2);
imshow(log(1+abs(fftshift(F))),[]);

H = laplacefilter(M,N);
H = H ./ max(abs(H(:))); % Scale the laplace to be between [0,1].
figure(3);
imshow(log(1+abs(fftshift(H))),[]);

G = H.*F;
figure(4);
imshow(log(1+abs(fftshift(G))),[]);
g = real(ifft2(G));
figure(5);
imshow(g,[]);

G2 = (1-H).*F;
g2 = real(ifft2(G2));
figure(6)
imshow(g2,[]);
