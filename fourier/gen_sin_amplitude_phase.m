function [y angles] = gen_sin_amplitude_phase(w, amplitude, phase, start_angle, end_angle, nb_points)

if (nb_points > 1)
    angle_incr = (end_angle - start_angle)/(nb_points-1);
else
    angle_incr = (end_angle - start_angle)/2;
end

y = zeros(1,nb_points);
angles = zeros(1,nb_points);
for i = 0:nb_points-1
    angle = start_angle + i*angle_incr;
    theta = w*angle;
    y(i+1) = amplitude*sin(w*angle+phase);
    angles(i+1) = angle; % Store and return them...
end
