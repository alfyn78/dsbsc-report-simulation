fs = 5000;
t = -0.1:1/fs:0.1;
fmessage = 100;
fcarrier = 500;

message = (cos(2*pi*fmessage*t));
subplot(4,1,1);
plot(t, message); grid on
title("Message Signal");

carrier = cos(2*pi*fcarrier*t);
subplot(4,1,2);
plot(t, carrier); grid on
title("Carrier Signal");

st = message.*carrier;
subplot(4, 1, 3);
plot(t, st); grid on
title("DSB-SC Modulated Signal");

L = length(st);
NFFT = 2^nextpow2(L);
y_fft = 2*abs(fft(st,NFFT)/L);
freq = fs/2*linspace(0,1,NFFT/2+1);
subplot(4, 1, 4);
plot(freq,y_fft(1:NFFT/2+1)); grid on
title("Fourier of Modulated Signal");