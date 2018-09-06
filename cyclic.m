function [baseband] = cyclic(fft_type,inv_fft)
    baseband = [];
    packets = length(inv_fft) / fft_type.N;
    
    start = 1;
    p_start = fft_type.N - (fft_type.N / 4) + 1;
    p_end = fft_type.N;
    for x = 1:packets
        baseband = [baseband inv_fft(p_start:p_end)];
        baseband = [baseband inv_fft(start:p_end)];
        start = start + fft_type.N;
        p_start = p_start + fft_type.N;
        p_end = p_end + fft_type.N;
    end
end