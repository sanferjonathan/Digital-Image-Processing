clear
close all

%x = (-2:0.01:2);
x = (-10:0.01:10);  % To show that the function is periodic over 2*pi

%y = sin(x) + sin(3*x)/3 + sin(5*x)/5 + sin(7*x)/7 + sin(9*x)/9 + sin(11*x)/11 + sin(13*x)/13 + sin(15*x)/15;

% The same signal but where the signal goes from -1 to 1 (and not ~-0.8
% -~0.8)
y = 1/pi*4/1*sin(x) + 1/pi*4/3*sin(3*x) + 1/pi*4/5*sin(5*x) + 1/pi*4/7*sin(7*x) + 1/pi*4/9*sin(9*x) + 1/pi*4/11*sin(11*x) + 1/pi*4/13*sin(13*x) + 1/pi*4/15*sin(15*x);

plot(x,y)
hold on

y2 = 1/pi*4/1*sin(x) + 1/pi*4/3*sin(3*x) + 1/pi*4/3*sin(3*x) + 1/pi*4/3*sin(3*x) + 1/pi*4/3*sin(3*x) + 1/pi*4/3*sin(3*x) + 1/pi*4/3*sin(3*x) + 1/pi*4/3*sin(3*x);

plot(x,y2)
hold on

tmp = size(x);
y2 = zeros(1,tmp(2));

for i = 0:10000
    odd = i*2+1;
    %y2 = y2 + sin(odd*x) / odd;
    y2 = y2 + 1/pi*4/odd * sin(odd*x); % This contains the correction term
    %to actually go between -1 and 1. (4/pi)...
   
end


plot(x,y2)

%Här anger i = n hur många summationer vi har, detta kommer att påverka
%frekvenzen av vågen. Ju högre värde på i desto högre frekvenz. Värdet på i
%ger alltså antalet mindre svängningar per stor svängnign som är 2 pi.