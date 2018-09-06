function [baseband, blocks] = transmitter(msg, fft_type)
    [msg, nulls] = preprocess_message(msg, fft_type);
    
    % ASCII Coding:
    bin = ascii_coding(msg);
    
    % Symbol Modulation
    symbols = symbol_mod(bin, fft_type.Mod_method);
    
    % add null carriers
    null_symbol = 0 + 0i;
    while nulls > 0
        symbols = [symbols null_symbol];
        nulls = nulls - 1;
    end
    
    % Carrier and Pilot Mapping
    blocks = cp_map(symbols,fft_type);
    
    % IFFT
    inv = ifft(blocks);
    
    % Cyclic Prefix
    baseband = cyclic(fft_type,inv);
end