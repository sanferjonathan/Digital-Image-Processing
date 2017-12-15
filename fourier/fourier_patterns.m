%% Visualize the fourier transform of different patterns

close all;
clear all;

% Parameters
lx = 5; % Half size in x direction
ly = 5; % Half size in y direction
xo = 0; % Offset in x direction
yo = 0; % Offset in y direction
background = 0; % Background intensity
foreground = 255; % Foreground intensity


I = zeros(512,512);
[rr cc] = meshgrid(1:512);
   
circle = 0;

while(1)

    % Makes a rectangle...
   I(:,:) = background;
   I(256-lx+yo:256+lx+yo, 256-ly+xo:256+ly+xo) = foreground;
   
   % A circle
   if circle == 1
       I = sqrt((rr-yo).^2+(cc-xo).^2)<=lx;
   end
   
   Y=fft2(I);
   Y=fftshift(Y); % Center FFT
        
   F = fourier_scale_spectrum_for_plotting(Y);
   
   % Plot the phase
   phases = atan2(imag(Y),real(Y));
   
   figure(1)
   figure(2);
   imshow(F);
   figure(3); 
   imshow(mat2gray(phases)); % mat2gray -> scale the numbers [0 .. 1]
   figure(1)
   imshow(I);
    
   waitforbuttonpress;
   str = get(gcf,'currentcharacter'); 
   if (str == 'a') 
       lx = lx + 1;
   elseif (str == 'z')
       lx = lx - 1;
   elseif (str == 's')
       ly = ly + 1;
   elseif (str == 'x')
       ly = ly - 1;
   elseif (str == 'd')
       xo = xo + 10;
   elseif (str == 'c')
       xo = xo - 10;
   elseif (str == 'f')
       yo = yo + 10;
   elseif (str == 'v')
       yo = yo - 10;
   elseif (str == 'g')
       if circle == 0
           circle = 1
       else
           circle = 0
       end
   elseif (str == 'b')
       if background == 255
           background = 0;
           foreground = 255;
       else
           background = 255;
           foreground = 0;
       end
   end


end
