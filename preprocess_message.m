function [msg, nulls] = preprocess_message(msg, fft_type)
    % number of data carriers in each packet
    data_carriers = fft_type.N - length(fft_type.Unused) - length(fft_type.Pilot);
    
    % number of bytes (8-bits) in message
    bytes = length(msg);
    
    % number of message bits per data carrier
    mod_methods = {'BPSK', 'QPSK', '8PSK'};
    bits = find(ismember(mod_methods, fft_type.Mod_method));
    
    % add spaces to end of message so there is an integer number of data
    % carriers used
    while bytes / bits > floor(bytes / bits)
        msg = [msg ' '];
        bytes = length(msg);
    end
    
    % number of data carriers used from message
    carriers = (bytes * 8) / bits;
    
    % number of packets needed to store message
    packets = ceil(bytes / ((data_carriers / 8) * bits));
    
    % number of unused data carriers remaining in last packet
    free = (packets * data_carriers) - carriers;
    
    % number of spaces to fill up an integer number of unused carriers
    space = free;
    while (space * bits) / 8 > floor((space * bits) / 8)
        space = space - 1;
    end
    space = (space * bits) / 8;
    
    for x = 1:space
        msg = [msg ' '];
    end
    
    % number of null carriers to add after spaces
    nulls = free - ((space * 8) / bits);
end