function plot_results(fft_type, sent, rec, err)
    figure(3);
    title('\bfTransmited Text');
    axis off;
    line_width = 75;
    lines = ceil(length(sent.msg)/line_width);
    for i = 1:lines
        if i == lines
            text(0, 1 - (i*0.15), sent.msg(line_width*(i - 1) + 1:end));
        else
            text(0, 1 - (i*0.15), sent.msg(line_width*(i - 1) + 1:line_width*i));
        end
    end
    set(gcf, 'Position', [50 0 600 150]);
    
    figure(4);
    title(sprintf('\\bfRecovered Text\n\\rmBER: %.2g', err.ber));
    axis off;
    line_width = 75;
    lines = ceil(length(rec.msg)/line_width);
    for i = 1:lines
        if i == lines
            text(0, 1 - (i*0.15), rec.msg(line_width*(i - 1) + 1:end));
        else
            text(0, 1 - (i*0.15), rec.msg(line_width*(i - 1) + 1:line_width*i));
        end
    end
    set(gcf, 'Position', [650 0 600 150]);
    
    figure(1);
    plot_signal(sent.signal, fft_type);
    title(sprintf('\\bfTransmited Constellation\n\\rm%s Modulation', fft_type.Mod_method));
    set(gcf, 'Position', [50 150 600 500]);
    
    figure(2);
    plot_signal(rec.signal, fft_type);
    title(sprintf('\\bfReceived Constellation\n\\rmMeasured SNR: %.2f dB', err.snr));
    set(gcf, 'Position', [650 150 600 500]);
end