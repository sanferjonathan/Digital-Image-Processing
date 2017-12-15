%% Visualize the ifft from a webcamera
% To get this to run you need to install the 'MATLAB Support Package for
% USB Webcams'

close all;
clear all;

camList = webcamlist
cam = webcam(1)

% Aquire a single frame and compute the fft.
for idx = 1:10000

    img = snapshot(cam);
%    image(img);
    img_gray = rgb2gray(img);
    
    % Resize the image 
    I = imresize(img_gray,[512 512]);
    Y=fft2(I);
    Y=fftshift(Y); % Center FFT
        
    F = fourier_scale_spectrum_for_plotting(Y);

    
    % Find pixels that are brighter than the threshold.
    thresh=0.8*max(F(:));
    mask = F > thresh;
    
    % Erase those from the image
    Y(mask) = 0;

    F2 = fourier_scale_spectrum_for_plotting(Y);
    
    % Shift back and inverse fft
    filteredImage = ifft2(fftshift(Y)); % + mean2(I);
    
    % View all images at once (you can also use subplot), simpy stitch them
    % together to one long image.
    
    % Extract only the central part of the image for better visualization
    half_height = 40;
    half_width = 40;
    F = F(256-half_width:256+half_width, 256-half_height:256+half_height);
    F2 = F2(256-half_width:256+half_width, 256-half_height:256+half_height);
    F = imresize(F, [512, 512]);
    F2 = imresize(F2, [512,512]);
    
    image_to_show = [F, F2, filteredImage./256];
    %image_to_show = [F, F2];
    imshow(image_to_show, []);
    
    % Note that only a small part of the spectrum is used. This can be seen
    % as a compression method.
end

clear cam
