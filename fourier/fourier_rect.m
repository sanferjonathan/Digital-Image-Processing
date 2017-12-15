close all;
clear;

d = 0.5;

nb_points = 100; % Need atleast 5 points to viualize the points...
f = ones(1,nb_points);
f = f .* d / pi;

for n = 1:10000

    [cos_nd angles] = gen_sin_amplitude_phase(n, 1, pi/2, -pi, pi, nb_points);
   
    clf;

   %plot(f, 'x'); % Plot with the number of points used along the x axis
    plot(angles, f, 'x');
    hold on
    plot(angles, rectangularPulse(angles), 'r-');
    
    waitforbuttonpress;
    
    f = f + 2/pi * (sin(n*d))/n .* cos_nd;
    
end