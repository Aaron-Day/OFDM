function plot_signal(signal, fft_type, cyclic_prefix, normalize, print_coordinates)
    %{
        default values for cyclic_prefix, normalize, and print
            cyclic_prefix: does the signal include the Cyclic Prefix?
            normalize: do you want to normalize the signal (force carrier
                into nearest position)?
            print: do you want to print the coordinates of each carrier?
    %}
    switch(nargin)
        case 2
            cyclic_prefix = false;
            normalize = false;
            print_coordinates = false;
        case 3
            normalize = false;
            print_coordinates = false;
        case 4
            print_coordinates = false;
        case 5
        otherwise
            error('Invalid number of args');
    end
    
    % plotting colors and symbols
    null = 'ro';
    pilot = 'go';
    data = 'b*';
    
    % carrier indices of each packet
    if cyclic_prefix
        range = fft_type.N/4:fft_type.N/2 - 1;
        range = [range -fft_type.N/2:fft_type.N/2 - 1];
    else
        range = -fft_type.N/2:fft_type.N/2 - 1;
    end
    
    % number of blocks
    blocks = length(signal) / length(range);
    if mod(blocks,1) > 0
        fprintf('signal: %d, range: %d, blocks: %d\n',length(signal),length(range),blocks);
        error('Invalid cyclic prefix');
    end
    
    if normalize
        signal = normalize(signal, fft_type.Mod_method);
    end
    
    unit_circle();
    for x = 1:blocks
        for y = 1:length(range)
            index = (x-1)*length(range) + y;
            if ismember(range(y),fft_type.Unused)
                plot(real(signal(index)),imag(signal(index)),null);
            elseif ismember(range(y), fft_type.Pilot)
                plot(real(signal(index)),imag(signal(index)),pilot);
            else
                plot(real(signal(index)),imag(signal(index)),data);
            end
            if print_coordinates
                fprintf('fig: %d, cycle: %d, carrier: %d, real: %d, imag: %d\n',next_fig,x,range(y),real(signal(index)),imag(signal(index)));
            end
        end
    end
end