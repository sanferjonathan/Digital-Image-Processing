close all;
clear all;

f = imread('clown.tif');
[M N] = size(f);
imshow(f,[]); 


F = fft2(f);
figure(1);
imshow(log(1+abs(fftshift(F))),[]);

disp('a/z change sigma in the lowpass filter, s/x change the filter type (none, gauss, ideal, butterworth), d/w, sigma in the high pass fitler, f/v change the high pass filter type.')


sigL = 3;
sigH = 15;
typeL = 1;
typeH = 0;
while(1)
   %str = input(prompt,'s');
   waitforbuttonpress;
   str = get(gcf,'currentcharacter'); 
   if (str == 'a') 
       sigL = sigL + 1;
   elseif (str == 'z')
       sigL = sigL - 1;
   elseif (str == 's')
       typeL = typeL + 1;
   elseif (str == 'x')
       typeL = typeL -1;
   elseif (str == 'd')
       sigH = sigH + 1;
   elseif (str == 'c')
       sigH = sigH - 1;
   elseif (str == 'f')
       typeH = typeH + 1;
   elseif (str == 'v')
       typeH = typeH -1;
   end
   
   
   if (typeL < 0)
       typeL = 0;
   end
   if (typeL > 3)
       typeL = 3;
   end
   
   if (typeH < 0)
       typeH = 0;
   end
   if (typeH > 3)
       typeH = 3;
   end
   
   if (sigL <= 0)
       sigL = 0.1;
   end
   if (sigH <= 0)
       sigH = 0.1;
   end
   
   param = 'gaussian';
   if typeL == 2
       param = 'ideal';
   elseif typeL == 3
       param = 'btw';
   end
   L = lpfilter(param, M, N, sigL);
   
   param = 'gaussian';
   if typeH == 2
       param = 'ideal';
   elseif typeH == 3
       param = 'btw';
   end
   % High pass filter is simply 1 - the low pass filter 
   H = 1 - lpfilter(param, M, N, sigH);
   if (typeL == 0)
       L = zeros(M,N);
   end
   if (typeH == 0)
       H = zeros(M,N);
   end
   
   figure(2);
   imshow(real(fftshift(H+L)),[]);
   G = (H+L).*F;
   figure(3);
   imshow(log(1+abs(fftshift(G))),[]);
   g = real(ifft2(G));
   figure(4);
   imshow(g,[]);
end
