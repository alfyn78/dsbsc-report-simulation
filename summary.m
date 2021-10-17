fc = 1000;
fs = fc*10;
t = [-0.1:1/fs:0.1];

message  = cos(2*pi*100*t) ...
    - (1/3)*(cos(2*pi*60*t)) ...
    + (1/5)*(cos(2*pi*4*t));

carrier = cos(2*pi*fc*t);

hf = exp(-2i*pi*5*t)+exp(-2i*pi*30*t); 

xt = message.*carrier;
yt = ifft(fft(xt).*hf);

vt = xt.*carrier;
[b,a]=butter(4,120/(fs/2));
mt_prime = filter(b,a,vt);

figure()
subplot(4,1,1)
plot(t,mt_prime,t,message); grid on; 
title("Plotting of Demodulated signal and Original message signal");
legend({'Demodulated signal', 'Original message'},'Location','southwest');

L = length(message);
NFFT1 = 2^nextpow2(L);
y_fft1 = 2*abs(fft(message,NFFT1)/L);
freq1 = fs/2*linspace(0,1,NFFT1/2+1);

L = length(mt_prime);
NFFT2 = 2^nextpow2(L);
y_fft2 = 2*abs(fft(mt_prime,NFFT2)/L);
freq2 = fs/2*linspace(0,1,NFFT2/2+1);

subplot(4,1,3)
plot(freq2, y_fft2(1:NFFT2/2+1),freq1, y_fft1(1:NFFT1/2+1)); grid on
title("Plotting of Demodulated signal and Original message signal")
legend({'Demodulated signal', 'Original message'},'Location','southeast');