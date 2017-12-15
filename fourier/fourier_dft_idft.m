%%% Example program to illustrate the fourier_dft.m and fourier_idft.m functions.

clear all;
close all;

% Define an arbitrary vector.
% A set of 'interesting functions'
X = [1 1 2]

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

