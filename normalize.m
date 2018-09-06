function [signal] = normalize(signal, fft_type)
    % remove rounding errors from plot
    validate_modulation(fft_type.Mod_method);
    if strcmp(fft_type.Mod_method, 'BPSK')
        signal = normalize_bpsk(signal);
    elseif strcmp(fft_type.Mod_method, 'QPSK')
        signal = normalize_qpsk(signal);
    else
        signal = normalize_8psk(signal);
    end
end