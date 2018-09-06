function ber = calc_ber(msg, rec_msg)
    msg_bin = ascii_coding(msg);
    rec_msg_bin = ascii_coding(rec_msg);
    if length(msg_bin) < length(rec_msg_bin)
        msg_bin = [msg_bin; repmat('0', abs(length(msg_bin)-length(rec_msg_bin)), 1)];
    elseif length(msg_bin) > length(rec_msg_bin)
        rec_msg_bin = [rec_msg_bin; repmat('0', abs(length(msg_bin)-length(rec_msg_bin)), 1)];
    end
    ber = sum(abs(rec_msg_bin - msg_bin))/length(msg_bin);
end