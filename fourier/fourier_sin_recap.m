% Generate a set of sample sin function
close all
clear


x = (0:0.01:2*pi);

figure(1)
y1 = sin(x);
h = plot(x,y1);
set(h,'LineWidth',2);

figure(2)
y2 = sin(2.*x);
h = plot(x,y2);
set(h,'LineWidth',2);

figure(3);
y3 = sin(x+pi/4);
h = plot(x,y3);
set(h,'LineWidth',2);

figure(4);
y4 = 2*sin(x);
h = plot(x,y4);
set(h,'LineWidth',2);

figure(5);
h1 = plot(x,y1);
hold on
h2 = plot(x,y2);
h3 = plot(x,y3);
h4 = plot(x,y4);
set([h1 h2 h3 h4],'LineWidth',2);

