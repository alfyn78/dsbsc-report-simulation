% ==================================================================
% Preliminaries variables
% ==================================================================

% Frequency & Time
fc = 1000;
fs = fc*10;
t = [-0.1:1/fs:0.1];

% Message Signal
last3 = [1 6 4]; % Student ID: 20216[1]00[6][4]
f1 = last3(1); f2 = last3(2); f3 = last3(3);

message  = cos(2*pi*f1*100*t) ...
    - (1/3)*(cos(2*pi*f2*10*t)) ...
    + (1/5)*(cos(2*pi*f3*t));

% Carrier Signal
A = 1; % Carrier Amplitude
carrier = A*(cos(2*pi*fc*t));

% Channel characteristic
hf = exp(-2i*pi*5*t)+exp(-2i*pi*30*t); % In frequency domain

% ==================================================================
% Main function
% [mt]--mod-->[xt]--channel-->[yt]--demod-->[vt]--LPF-->[m't]
% ==================================================================

% Signal modulation: [mt]--mod-->[xt]
xt = signalMod(message, carrier, fc);

% Channel distortion: [xt]--channel-->[yt]
yt = signalDistort(xt, hf, t, fs);

% Signal demodulation: [yt]--demod-->[vt]--LPF-->[m't]
vt = signalDemod(yt, carrier, fc);

