function [num] = bindec_to_dec(bits)
    % interpret 0 and 1 characters as binary and convert to dec equivilant
    num = 0;
    for i = 0:length(bits)-1
        num = num + double(bits(length(bits)-i)-48)*2^(i);
    end
end