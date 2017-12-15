function Y = fourier_dft(X)

n = size(X,2);
Y = zeros(1,n);
for k = 1:n % k - the 'sin wave' index
     for j = 1:n % j  - the idx along the sin wave
         omega = 2*pi*(j-1)*(k-1) / n;
         disp('omega:')
         disp('pi * ');
         disp(2*(j-1)*(k-1));
         disp('-----');
         disp(n);
         Y(k) = Y(k) + X(j) * exp(-2i * pi * (j-1)*(k-1) / n);
     end
 end

