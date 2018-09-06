clear;
clc;
close all;

%% Simulation parameters
% Source text filename
filename = 'Test.txt';

% IFFT/FFT size: 32, 64, 128
n_fft = 64;

% Modulation method: BPSK, QPSK, 8PSK
mod_method = '8PSK';

% Pilot mapping method: A, B
map_method = 'B';

% Target SNR
snr = 15;

%% Simulate
msg = get_msg(filename);
fft_type = get_fft(n_fft, mod_method, map_method);

% Transmit Message
[baseband, blocks] = transmitter(msg, fft_type);

% Add noise
[baseband_noise, snr_measure] = noise(baseband, snr);

% Receive Message
[rec_msg, rec_blocks] = receiver(baseband_noise, fft_type);

% Calculate bit error rate
ber = calc_ber(msg, rec_msg);

% Plot signals & print messages
plot_settings.cyclic_prefix = false;
plot_settings.normalization = false;
plot_settings.print_coordinates = false;

sent.signal = blocks;
sent.msg = msg;
rec.signal = rec_blocks;
rec.msg = rec_msg;
err.snr = snr_measure;
err.ber = ber;

plot_results(fft_type, sent, rec, err);