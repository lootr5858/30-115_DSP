% Generate a unit sample sequence
clf;

% Generate a vector from -10 to 20
n = 0:74;

% Generate N number of random values
N = length(n);
mean = 0;
std_dev = sqrt(3);
x =  mean + std_dev .* randn(1, N);

% Generate the unit sample sequence
u = x; % Fill up the blank

% Plot the unit sample sequence
stem(n,u);
xlabel('Time index n');
ylabel('Amplitude');
title('Unit Sample Sequence');
axis([0 75 -5 5]);