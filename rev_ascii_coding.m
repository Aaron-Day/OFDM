function [msg] = rev_ascii_coding(bin)
    msg = [];
    characters = length(bin) / 8;
    for x = 1:characters
        index = (x-1)*8 + 1;
        ch = bin(index:index+7);
        val = 0;
        for y = 0:7
            val = val + ch(8-y)*2^y;
        end
        msg = [msg char(val)];
    end
end
