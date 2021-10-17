function vt = signalDemod(yt, car, fc)

fs = fc*10;
t = -0.1:1/fs:0.1;

% Signal demodulation
vt = yt.*car;

% Low Pass Filter
ffilter = fs/2;
[b,a]=butter ( 4, 120 / ffilter );
filtered = filter(b,a,vt);

figure()

subplot(4,1,1);
plot(t, vt); grid on
title("Demodulated Signal");

plotFourier(vt, fs, [4 1 2])

subplot(4, 1, 3);
plot(t, filtered); grid on
title("Filtered Demodded Signal (Original Message)");

plotFourier(filtered, fs, [4 1 4])
