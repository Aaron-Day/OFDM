function fft_type = get_fft(n_fft, mod_method, map_method)
    fft_type.N = n_fft;
    fft_type.Mod_method = mod_method;
    fft_type.Map_method = map_method;
    switch(n_fft)
        case 32
            fft_type.Unused = [ -16, -15, -14, 0, +14, +15 ];
            fft_type.Pilot = [ -13, -4, +4, +13 ]; % Method B
        case 64
            fft_type.Unused = [ -32, -31, -30, -29, 0, +29, +30, +31 ];
            fft_type.Pilot = [ -28, -20, -12, -4, +4, +12, +20, +28 ]; % Method B
        case 128
            fft_type.Unused = [ -64, -63, -62, -61, -60, 0, +60, +61, +62, +63, ];
            fft_type.Pilot = [ -59, -52, -44, -36, -28, -20, -12, -4, +4, +12, +20, +28, +36, +44, +52, +59 ]; % Method B
    end
    if strcmp(map_method, 'A')
        fft_type.Pilot = -fft_type.N/2+1:2:fft_type.N/2;
        fft_type.Pilot = fft_type.Pilot(not(ismember(fft_type.Pilot,fft_type.Unused)));
    end
end