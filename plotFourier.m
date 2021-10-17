function plotFourier(in_signal, in_fs, subPlot)

%{
Fourier transform of input signal and plot the result
Parameters:
    in_signal == Input signal
    in_fs == Input sampling frequency 
    subPlot == State dimension of the desire subplot as [row col axis]
%}

signal = in_signal;
fs = in_fs;

L = length(signal);
NFFT = 2^nextpow2(L);
y_fft = 2*abs(fft(signal,NFFT)/L);
freq = fs/2*linspace(0,1,NFFT/2+1);

subplot(subPlot(1),subPlot(2),subPlot(3));
plot(freq, y_fft(1:NFFT/2+1)); grid on
title("Fourier Transform of Signal")