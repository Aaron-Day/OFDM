function [carriers] = cp_map(data_carriers, fft_type)
    null_symbol = 0 + 0i;
    pilot_symbol = 1 + 0i;
    carriers = [];
    
    all = -fft_type.N/2:fft_type.N/2-1;
    
    l = 1;
    while l < length(data_carriers);
        for x = all
            if ismember(x,fft_type.Unused)
                carriers = [carriers null_symbol];
            elseif ismember(x,fft_type.Pilot)
                carriers = [carriers pilot_symbol];
            else
                carriers = [carriers data_carriers(l)];
                l = l + 1;
            end
            %fprintf('carrier: %d, real: %d, imag: %d\n',x,real(vals(x+fft_type.N/2+1)),imag(vals(x+fft_type.N/2+1)));
        end
    end
end