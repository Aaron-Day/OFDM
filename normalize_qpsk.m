function [carrier] = normalize_qpsk(carrier)
    % starting angle
    start = pi/8;
    
    for x = 1:length(carrier)
        a = real(carrier(x));
        b = imag(carrier(x));
        c = sqrt(a*a + b*b); % dist from center
        d = angle(carrier(x)); % angle in radians
        % null carriers
        if c < .5
            carrier(x) = 0 + 0i;
        % -pi/8 to pi/8: pilot carriers
        elseif and(d >= -start, d < start)
            carrier(x) = 1 + 0i;
        % pi/8 to pi/2: data carriers {00}
        elseif and(d >= start, d < 4 * start)
            carrier(x) = sqrt(2)/2 + (sqrt(2)/2)*1i;
        % pi/2 to pi: data carriers {01}
        elseif d >= 4 * start
            carrier(x) = -sqrt(2)/2 + (sqrt(2)/2)*1i;
        % -pi to -pi/2: data carriers {10}
        elseif d < -4 * start
            carrier(x) = -sqrt(2)/2 - (sqrt(2)/2)*1i;
        % -pi/2 to -pi/8: data carriers {11}
        else
            carrier(x) = sqrt(2)/2 - (sqrt(2)/2)*1i;
        end
    end
end