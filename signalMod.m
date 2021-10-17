function xt = signalMod(mes, car, fc)

fs = fc*10;
t = -0.1:1/fs:0.1;

% Signal modulation
xt = mes.*car;

figure()

subplot(4,1,1);
plot(t, mes); grid on
title("Message Signal");

subplot(4,1,2);
plot(t, car); grid on
title("Carrier Signal");

subplot(4,1,3);
plot(t, xt); grid on
title("DSB-SC Modulated Signal, x(t)");

% plotFourier(mes, fs, [4 1 4])
plotFourier(xt, fs, [4 1 4])