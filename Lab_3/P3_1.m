% Program P3_1
% Conversion of a rational transfer function
% to its factored form
clear
num = input('Numerator coefficient vector = ');
den = input('Denominator coefficient vector = ');
[z,p,k] = tf2zp(num,den);
sos = zp2sos(z,p,k)

subplot(2,1,1)
w = -pi:2*pi/255:pi;
h1 = freqz(num, den, w);
plot(w/pi,abs(h1));grid
title('Magnitude Spectrum','FontSize',8)
xlabel('\omega /\pi');
ylabel('Amplitude');

subplot(2,1,2)
plot(w/pi,angle(h1));grid
title('Phase Spectrum','FontSize',8)
xlabel('\omega /\pi');
ylabel('Phase in radians');