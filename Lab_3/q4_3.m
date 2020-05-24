wp = 0.2 * pi;
ws = 0.3 * pi;
As = 50;    % stopband ripple (db)
Rp = 25;    % passband ripple (db)
mags = [1 0];
fsample = 10000;

% Obtain delta specs
% d1: Passband tolertance
% d2: Stopband tolerance
[d1,d2] = db2delta(Rp,As);
ripple = [d1,d2];

fp = (0.2 * pi * fsample)/(2*pi);
fs = (0.3 * pi * fsample)/(2*pi);
fcut = [fp, fs];

% obtain b from func firpm
[n,fo,ao,w] = firpmord(fcut, mags, ripple, fsample);
b = firpm(n,fo,ao,w);

% obtain freq response
a= [1];
[db,mag,pha,grd,w] = freqz_m(b,a);

% plot 1
subplot(3,1,1)
plot(w/pi, db); grid;
xlabel("\omega, \pi");
ylabel("Gain, db");
title("Gain Response");

% plot 2
subplot(3,1,2)
plot(w/pi, mag); grid;
xlabel("\omega, \pi");
ylabel("Abs gain");
title("Abs Gain Response");

% plot 3
subplot(3,1,3)
plot(w/pi, pha); grid;
xlabel('\omega , \pi');  
ylabel('Phase in rad'); 
title('Phase Response');


% Conversion of dB specs to delta specs
function [d1,d2] = db2delta(Rp,As)
K = 10^(Rp/20);
d1 = (K-1)/(K+1);
d2 = (1+d1)*(10^(-As/20));
end

% A modified version of the Matlab function “freqz.m”.
function [db,mag,pha,grd,w] = freqz_m(b,a)
[H,w] = freqz(b,a,1000,'whole') ;
    H = (H(1:1:501))';      w = (w(1:1:501))';
  mag = abs(H);
   db = 20*log10((mag+eps)/max(mag));
  pha = angle(H);
  grd = grpdelay(b,a,w);
end