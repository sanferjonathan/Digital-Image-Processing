%%% Example program to illustrate the fourier_dft.m and fourier_idft.m functions.

clear all;
close all;

% Define an arbitrary vector.
% A set of 'interesting functions'

X = zeros(1,64);
X(30:34) = 1;

%X = [1 1 2 4 5];

% Compute the DFT.
x = fourier_dft(X);

clf;
% Plot the aribtrary vector.
plot(X, 'bo');

% Plot the inverse fft (this should be exatcly the same as X.
hold on
plot(fourier_idft(x), 'rx');

% Write on screen
disp('Original vector X');
X
disp('fourier_dft(x)')
fourier_idft(x)
disp('The DFT of X:')
x

phases=atan2(imag(x),real(x));
amplitudes=abs(x);

figure(2)
h1=plot(amplitudes)
hold on
h2=plot(phases)
hold off
legend('amplitude','phase')
set([h1 h2],'LineWidth',2)

x2 = fftshift(x) % Shift to have the center part to be the lower frequencies

phases=atan2(imag(x2),real(x2));
amplitudes=abs(x2);

figure(3)
h1=plot(amplitudes)
hold on
h2=plot(phases)
hold off
legend('amplitude','phase')
set([h1 h2],'LineWidth',2)


[tmp N] = size(X);

% Angular increment for k = 1 and for k = N-1
k = 1;
omega1 = 2*pi*(1)*(k) / N
k = N-1;
omega2 = 2*pi*(1)*(k) / N
omega2 = omega2-2*pi

% The difference is only that the latter one (k=N-1) increase the angular
% velocity with a negative value compared to k = 1.
difference = omega1 + omega2


% Try another one... for k = 13 and for k = N - 13 the same property should
% hold...
k = 2;
n = 4;
omega1 = 2*pi*(n)*(k) / N
k = N-k;
omega2 = 2*pi*(n)*(k) / N
omega2 = omega2-2*pi*n
difference = omega1 + omega2


