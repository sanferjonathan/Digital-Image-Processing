%%% Example program to illustrate the fft and ifft functions.

% This also utilize the gen_sin_amplitude_phase.m to generate the wave
% functions which are then summed up to get back to the orignial function.

% Plotting colours and markers:
% blue circle - the input (X vector)
% red cross - the fft()->ifft() output [should be same as the blue 'o']
% green lines - each of the contributing sine wave.
% black line - the 'sum' of the green lines, this line should pass the 
%              blue circle (and the red x).


clear all;
close all;


% fft and ifft

% Define an arbitrary vector.
% A set of 'interesting functions'
%X = [-100 -100 -100 -100 -100 100 100 100 100 100]
%X = [0 1]
%X = [-5 -4 -3 -2 -1 0 1 2 3 4 5 -5 -4 -3 -2 -1 0 -1 -2 -3 -4 -5]
%X = [0 1 2 3 0]
X = [4 1]

% Compute the Fast Fourier Transform (FFT).
x = fft(X);

clf;
% Plot the aribtrary vector.
plot(X, 'bo');

% Plot the inverse fft.
hold on
plot(ifft(x), 'rx');

% Write on screen
disp('Original vector X');
X
disp('ifft(x)')
ifft(x)
disp('The FFT of X:')
x

% Complex numbers here?!?!?
% We need two properties, the amplitude the phase(!) [remember the
% interactive.m example.]
% Hint : The complex number is *just* another way of writing the 'polar 
% coordinate' or the 'equation of a circle' *absolutely nothing else what
% so ever*. This way of writing is called the Euler formula.
% e^(-i*theta) = cos(theta) + i*sin(theta).

% This is how we compute the phase and amplitude:
phases = atan2(imag(x),real(x))
amplitudes = sqrt(real(x).*real(x)+imag(x).*imag(x))

nb_points = size(X,2);

% This variable is only to set the number of visualization points (can be
% nb_points or a very high number to illustrate the sinus waves better).
% If you put it to a number which is low for example nb_points +2 the 
% the computation will be  done at the wrong coordinates and the 
% computation will be wrong.
% Mulitplication of the nb_points with a natural number (1,2,3,4,...) is 
% prefectly fine. Why is that?
%nb_points_vis = nb_points; % OK
%nb_points_vis = nb_points + 2; % BAD
nb_points_vis = nb_points * 20; % OK
%nb_points_vis = 1000; % OK unless the nb_points is large > 100. 

f = zeros(1, nb_points_vis);
X
% How can we compute this using our gen_sin_amplitude_phase.m utility?

% In this utility we use angle = w*theta as the input.
% Need to compute the w - omega, the frequency. In fft the angle are 
% computed as :
% theta = 2 * pi * (j-1)*(k-1) / n
% where n is the nb_points, j is the index to the 'sin' wave, and k is the
% index to the point. To compute w (omega) from this we need to consider
% the start and stop angles, (start angle = % 0, stop angle = pi). 
% Note that we also get all the points for the same wave number
% at once (that's why k-1 is replaced by (nb_points-1)/(stop-start).
% This is the equation we will get putting it together:
% w = 2*(i-1)*(nb_points-1)/nb_points;

for i=1:nb_points
    scale = 1/nb_points;

    % For a reference, this is how the inverse discrete fourier transform
    % (idft) is computed:
    %     theta = 2 * pi * (j-1)*(k-1) / n;
    %     X(j) = X(j) + 1/n * Y(k) * (cos(theta) + i*sin(theta));

    w = 2*(i-1)*(nb_points-1)/nb_points;
         
    [y angles] = gen_sin_amplitude_phase(w, amplitudes(i), phases(i)+pi/2, 0, pi, nb_points_vis);
    y = y*scale;
    % Need to plot in the same x coord system as the previous one. First
    % point in coord 1, second in coord 2 etc. This conversion is needed in 
    % case:
    % nb_points_vis != nb_points.
    plot_x_coordinates = angles ./ pi * (nb_points-1) + 1;
    
    hold on
    plot(plot_x_coordinates, y, 'g-');
    f = f + y;
end

plot(plot_x_coordinates, f, 'k-');
