function [msg, blocks] = receiver(baseband, fft_type)
    % Cyclic Prefix (reverse)
    inv_fft = rev_cyclic(fft_type, baseband);
    
    % IFFT (reverse)
    blocks = fft(inv_fft);
    
    % Carrier & Pilot Mapping (reverse)
    data_carriers = rev_cp_map(blocks, fft_type);
    
    % Symbol Modulation (reverse)
    bin = rev_symbol_mod(data_carriers, fft_type.Mod_method);
    
    % ASCII Coding (reverse)
    msg = rev_ascii_coding(bin);
    
    % trim ending spaces
    for x = 1:length(msg)
        if strcmp(msg(length(msg)),' ')
            msg = msg(1:length(msg) - 1);
        else
            break;
        end
    end
        
end