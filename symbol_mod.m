function [sym] = symbol_mod(bin, modulation)
    % map to BPSK
    if strcmp(modulation,'BPSK')
        sym = zeros(1,length(bin));
        for x = 1:length(bin)
            sym(x) = exp(1i*bin(x)*pi);
        end
        
    % map to QPSK
    elseif strcmp(modulation,'QPSK')
        sym = zeros(1,length(bin)/2);
        for x = 1:length(bin)/2
            num = bindec_to_dec(bin(2*x-1:2*x));
            sym(x) = exp(1i*((2*num+1)/4)*pi);
        end
        
    % map to 8PSK
    else
        sym = zeros(1,length(bin)/3);
        for x = 1:length(bin)/3
            num = bindec_to_dec(bin(3*x-2:3*x));
            sym(x) = exp(1i*(num/4)*pi);
        end
    end
end