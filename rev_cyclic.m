function [inv_fft] = rev_cyclic(fft_type,baseband)
    inv_fft = [];
    cycles = length(baseband) / (fft_type.N + fft_type.N / 4);
    %fprintf('cycles: %d\n',cycles);
    
    start = fft_type.N / 4 + 1;
    p_end = fft_type.N + fft_type.N / 4;
    for x = 1:cycles
        inv_fft = [inv_fft baseband(start:p_end)];
        start = start + fft_type.N + fft_type.N / 4;
        p_end = p_end + fft_type.N + fft_type.N / 4;
    end
end