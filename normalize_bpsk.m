function [carrier] = normalize_bpsk(carrier)
    % starting angle
    start = pi/2;
    
    for x = 1:length(carrier)
        a = real(carrier(x));
        b = imag(carrier(x));
        c = sqrt(a*a + b*b); % dist from center
        d = angle(carrier(x)); % angle in radians
        % null carriers
        if c < .5
            carrier(x) = 0 + 0i;
        % -pi/2 to pi/2: pilot carriers and data carriers {0}
        elseif and(d >= -start, d < start)
            carrier(x) = 1 + 0i;
        % pi/2 to -pi/2: data carriers {1}
        else
            carrier(x) = -1 + 0i;
        end
    end
end