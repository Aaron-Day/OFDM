function [baseband_noise, snr_measure] = noise(baseband, snr)
    %% Add AWGN
    % Calculate data power
    data_pwr = mean(abs(baseband.^2));

    % Add noise to channel
    noise_pwr = data_pwr/10^(snr/10);
    noise = normrnd(0, sqrt(noise_pwr/2), size(baseband)) + normrnd(0, sqrt(noise_pwr/2), size(baseband))*1i;
    baseband_noise = baseband + noise;

    % Measure SNR
    snr_measure = 10*log10(mean(abs(baseband.^2))/mean(abs(noise.^2)));
end