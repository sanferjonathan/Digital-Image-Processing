function F = fourier_scale_image_for_plotting(X) 


    % F contains the 2D fourier transform. To plot it use the following:
    F = abs(X); % Get the magnitude
    F = log(F+1); % Use log, for perceptual scaling, and +1 since log(0) is undefined
    F = mat2gray(F); % Use mat2gray to scale the image between 0 and 1

end