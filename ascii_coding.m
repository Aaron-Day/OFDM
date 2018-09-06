function msg_bin = ascii_coding(msg)
    msg_bin = dec2bin(msg(:), 8)';
    msg_bin = msg_bin(:);
end