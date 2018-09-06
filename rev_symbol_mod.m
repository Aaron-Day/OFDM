function [bin] = rev_symbol_mod(data_carriers, modulation)
    % map from BPSK
    if strcmp(modulation,'BPSK')
        bin = zeros(1,length(data_carriers));
        for x = 1:length(bin)
            bin(x) = abs(round(log(data_carriers(x))/(pi*1i)));
        end
        
    % map from QPSK
    elseif strcmp(modulation,'QPSK')
        bin = zeros(1,length(data_carriers)*2);
        for x = 1:length(data_carriers)
            dec = mod(round(log(data_carriers(x))*(2/(pi*1i))-(1/2))+4,4);
            bin(2*x-1:2*x) = dec2bin(dec,2)-48;
        end
        
    % map from 8PSK
    else
        bin = zeros(1,length(data_carriers)*3);
        for x = 1:length(data_carriers)
            dec = mod(real(round(log(data_carriers(x))*(4/(pi*1i)))+8),8);
            bin(3*x-2:3*x) = dec2bin(dec,3)-48;
        end
    end
end