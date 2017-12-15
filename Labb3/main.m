im = rgb2gray(imread('mandrill.tif'));

im = im2double(im);
f = fft2(im);
mag = abs(fftshift(f));
phase = exp(1i*angle(f));
log_f = log(abs(fftshift(f)));%moving the lowest freq to the middle of image
invers_m = ifft2(log_f);
invers_p = ifft2(phase);

figure()
%value with low freq ends up in the middle white spot and higher freq the
%further away from the center
subplot(2,3,1)
imshow(phase, []);
title('Phase');
subplot(2,3,2)
imagesc(log_f);
colormap(gray);
title('Magnitude');
subplot(2,3,3)
plot(phase);
title('');
subplot(2,3,4)
plot(log_f);
subplot(2,3,5)
imagesc(invers_m);
subplot(2,3,6)
imshow(invers_p, []);
%colormap gray
%title('');
%%
%1.2
im_m = im2double(rgb2gray(imread('mandrill.tif')));
im_c = im2double(imread('clown.tif'));

f_imC = fft2(im_c);
f_imM = fft2(im_m);

R1 = abs(f_imM);
theta1 = angle(f_imM);
com1 = cos(theta1) .* R1 + sin(theta1) .* R1 .* 1i;
im1 = reshape(com1,[256,256]);


R2 = abs(f_imC);
theta2 = angle(f_imC);
com2 = cos(theta2) .* R1 + sin(theta2) .* R1 .* 1i;
im2 = reshape(com2,[256,256]);

im3 = abs(ifft2(im2));

imshow(im3);

%{
%phase
m_phase = atan2(imag(f_imM),real(f_inM));
c_phase = atan2(imag(f_imC),real(f_imC));
%magnitude
m_mag = abs(m_phase);
c_mag = abs(c_phase);


imshow(im_c);
imagesc(log_f);
colormap(gray);
imshow(m_phase);
%}















