%%% L-point DFT X[k] of  sequence x[n] of length N & L>=N
%   Length N
%   Fundamental period L
%   L >= N

clf;

% define N & L (L >= N)
N = 250;
L = 250;

% summation index
vec_k = 0:L-1;
vec_n = 0:N-1;

% generate signal X[k]
x_real =  [0.1*(1:100) zeros(1,N-100)];
x_img =  [zeros(1,N)];
x = x_real + 1i * x_img;

% DFT
XF = fft(x, L);

% plot real & img of x
subplot(3,2,1);grid;
plot(vec_n,x_real);grid;
title('Re\{x[n]\}');
xlabel('Time index n');
ylabel('Amplitude');
subplot(3,2,2);
plot(vec_n,x_img);grid;
title('Im\{x[n]\}');
xlabel('Time index n');
ylabel('Amplitude');

% plot real and imag parts of DFT
subplot(3,2,3);
plot(vec_k,real(XF));grid;
title('Re\{X[k]\}');
xlabel('Frequency index k');
ylabel('Amplitude');
subplot(3,2,4);
plot(vec_k,imag(XF));grid;
title('Im\{X[k]\}');
xlabel('Frequency index k');
ylabel('Amplitude');
% IDFT
xx = ifft(XF,L);

% plot real and imaginary parts of the IDFT
subplot(3,2,5);
plot(vec_k,real(xx));grid;
title('Real part of IDFT\{X[k]\}');
xlabel('Time index n');
ylabel('Amplitude');
subplot(3,2,6);
plot(vec_k,imag(xx));grid;
title('Imag part of IDFT\{X[k]\}');
xlabel('Time index n');
ylabel('Amplitude');