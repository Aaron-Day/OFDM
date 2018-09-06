function [data_carriers] = rev_cp_map(carriers, fft_type)
    data_carriers = [];
    all = -fft_type.N/2:fft_type.N/2-1;
    packets = length(carriers) / fft_type.N;
    if mod(packets,1) > 0
        error('Invalid number of packets');
    end
    
    for x = 1:packets;
        for y = 1:length(all)
            index = (x-1)*length(all) + y;
            % not unused or pilot carrier
            if not(or(ismember(all(y),fft_type.Unused), ismember(all(y),fft_type.Pilot)))
                % not null carrier padding
                if not(and(abs(real(carriers(index))) < 0.00001, abs(imag(carriers(index))) < 0.00001))
                    data_carriers = [data_carriers carriers(index)];
                end
            end
        end
    end
end