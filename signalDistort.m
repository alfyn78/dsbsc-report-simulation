function yt = signalDistort(xt, hf, t, fs)

% Convert x(t) into frequency domain
xf = fft(xt);

% Matrix multiplication of x(f) and h(f)
yf = xf.*hf;

% Convert resulting signal back to time domain
yt = ifft(yf);

L = length(yf);
NFFT = 2^nextpow2(L);
y_fft = 2*abs(fft(yf,NFFT)/L);
freq = fs/2*linspace(0,1,NFFT/2+1);

L2 = length(xf);
NFFT2 = 2^nextpow2(L2);
y_fft2 = 2*abs(fft(xf,NFFT2)/L2);
freq2 = fs/2*linspace(0,1,NFFT2/2+1);

L3 = length(hf);
NFFT3 = 2^nextpow2(L3);
y_fft3 = 2*abs(fft(hf,NFFT3)/L3);
freq3 = fs/2*linspace(0,1,NFFT3/2+1);

figure()
subplot(4, 1, 1)
plot(freq3, y_fft3(1:NFFT3/2+1)); grid on; title('H(f)');
subplot(4, 1, 2)
plot(freq2, y_fft2(1:NFFT2/2+1)); grid on; title('X(f)');
subplot(4, 1, 3)
plot(freq, y_fft(1:NFFT/2+1)); grid on; title('Y(f)');
subplot(4, 1, 4)
plot(t, yt); grid on; title('y(t)');
