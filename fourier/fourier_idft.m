function X = fourier_idft(Y)

n = size(Y,2);
X = zeros(1,n);

phases = atan2(imag(Y),real(Y))
amplitudes = sqrt(real(Y).*real(Y)+imag(Y).*imag(Y))

for j = 1:n
        
     for k = 1:n
         %X(j) = X(j) + 1/n * Y(k) * exp(2i * pi * (j-1)*(k-1) / n);
         
         j
         k
         
         theta = 2 * pi * (j-1)*(k-1) / n
         y = 1/n * amplitudes(k) * (cos(theta + phases(k)))
         X(j) = X(j) + 1/n * amplitudes(k) * (cos(theta + phases(k)));
         
         % Same thing using e(-i*theta) = cos(theta) + i sin(theta)
         %X(j) = X(j) + 1/n * Y(k) * (cos(theta) + i*sin(theta));
     end
          
     % For image analysis and most other application we only care about
     % real value parts (non-complex input to the dft, hence we should have non-complex output here).
     X(j) = real(X(j)); % Get the real values (to avoid seeing 0.0000i in the output).

 end
