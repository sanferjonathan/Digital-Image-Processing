function H = laplacefilter(M, N)
%LPFILTER Computes frequency domain lowpass filters
%   H = LPFILTER(TYPE, M, N, D0, n) creates the transfer function of
%   a lowpass filter, H, of the specified TYPE and size (M-by-N).  To
%   view the filter as an image or mesh plot, it should be centered
%   using H = fftshift(H).
%
%   Valid values for TYPE, D0, and n are:
%
%   'ideal'    Ideal lowpass filter with cutoff frequency D0.  n need
%              not be supplied.  D0 must be positive
%
%   'btw'      Butterworth lowpass filter of order n, and cutoff D0.
%              The default value for n is 1.0.  D0 must be positive.
%
%   'gaussian' Gaussian lowpass filter with cutoff (standard deviation)
%              D0.  n need not be supplied.  D0 must be positive.

% Use function dftuv eto set up the meshgrid arrays needed for 
% computing the required distances.
[U, V] = dftuv(M, N);

% Compute the distances D(U, V).
D = sqrt(U.^2 + V.^2);

H = -4*pi*D.^2;        

end
