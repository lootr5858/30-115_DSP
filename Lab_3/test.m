fcuts = [2000 2500];
ripple = [0.005 0.005];
fsample = 10000;
mags = [1 0];
[n,Wn,beta,ftype] = kaiserord(fcuts, mags, ripple, fsample)

%fcuts = [2000 2500];
%ripple = [0.005 0.005];
%fsample = 10000;
%mags = [1 0];
%[n,Wn,beta,ftype] = kaiserord(fcuts, mags, ripple, fsample)