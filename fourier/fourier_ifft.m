function y = fourier_ifft(x,nfft,dim)
%IFFT Inverse discrete Fourier transform.
%   IFFT(X) is the inverse discrete Fourier transform of X.
%
%   IFFT(X,N) is the N-point inverse transform.
%
%   IFFT(X,[],DIM) or IFFT(X,N,DIM) is the inverse discrete Fourier
%   transform of X across the dimension DIM.
%
%   See also FFT, FFT2, IFFT2, FFTSHIFT.

%   J.N. Little 4-21-85
%   Revised 6-11-88 JNL
%   Copyright (c) 1984-98 by The MathWorks, Inc.
%   $Revision: 5.6 $  $Date: 1997/11/21 23:23:49 $

if nargin == 3
    y = conj(fft(conj(x),nfft,dim));
elseif nargin == 2
    y = conj(fft(conj(x),nfft));
else
    y = conj(fft(conj(x)));
end

if nargin<3,
    dim = min(find(size(x)>1));
    if isempty(dim), dim = 1; end
end

m = size(y,dim);
y = y/m;

