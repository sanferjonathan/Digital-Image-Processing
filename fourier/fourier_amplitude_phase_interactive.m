% Use key presses to change the amplitude and phase
clear all
close all

amplitudes = ones(1,4);
phases = zeros(1,4);

prompt = 'Enter the 1-4 to change the curve number -> a/z increase / decrease the amplitude, s/x increase / decrease the phase.'

curve_nb = 1;

while(1)
   %str = input(prompt,'s');
   waitforbuttonpress;
   str = get(gcf,'currentcharacter'); 
   if (str == 'a') 
       amplitudes(curve_nb) = amplitudes(curve_nb) + 0.1;
   elseif (str == 'z')
       amplitudes(curve_nb) = amplitudes(curve_nb) - 0.1;
   elseif (str == 's')
       phases(curve_nb) = phases(curve_nb) + 0.1;
   elseif (str == 'x')
       phases(curve_nb) = phases(curve_nb) - 0.1;
   elseif( str == '1')
       curve_nb = 1;
   elseif( str == '2')
       curve_nb = 2;
   elseif( str == '3')
       curve_nb = 3;
   elseif( str == '4')
       curve_nb = 4;
   end
           
   [f1 angles] = gen_sin_amplitude_phase(0, amplitudes(1), phases(1), 0, 2*pi, 81);    
   [f2 angles] = gen_sin_amplitude_phase(1, amplitudes(2), phases(2), 0, 2*pi, 81);    
   [f3 angles] = gen_sin_amplitude_phase(2, amplitudes(3), phases(3), 0, 2*pi, 81);    
   [f4 angles] = gen_sin_amplitude_phase(3, amplitudes(4), phases(4), 0, 2*pi, 81);    
           
   clf;
   plot(angles, f1, 'b-');
   hold on;
   plot(angles, f2, 'b-');
   plot(angles, f3, 'b-');
   plot(angles, f4, 'b-');
   
   f_sum = f1+f2+f3+f4;
   plot(angles, f_sum, 'r');
   plot(angles(1), f_sum(1), 'ro');
   plot(angles(21), f_sum(21), 'ro');
   plot(angles(41), f_sum(41), 'ro');
   plot(angles(61), f_sum(61), 'ro');
   
   % These are the angles used for the red circles
   angles(1)
   angles(21)
   angles(41)
   angles(61)
   
end

