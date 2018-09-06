function [carrier] = normalize_8psk(carrier)
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
        % -pi/8 to pi/8: pilot carriers and data carriers {000}
        elseif and(d >= -start, d < start)
            carrier(x) = 1 + 0i;
        % pi/8 to 3pi/8: data carriers {001}
        elseif and(d >= start, d < 3 * start)
            carrier(x) = sqrt(2)/2 + (sqrt(2)/2)*1i;
        % 3pi/8 to 5pi/8: data carriers {010}
        elseif and(d >= 3 * start, d < 5 * start)
            carrier(x) = 0 + 1i;
        % 5pi/8 to 7pi/8: data carriers {011}
        elseif and(d >= 5 * start, d < 7 * start)
            carrier(x) = -sqrt(2)/2 + (sqrt(2)/2)*1i;
        % 7pi/8 to -7pi/8: data carriers {100}
        elseif or(d >= 7 * start, d < -7 * start)
            carrier(x) = -1 + 0i;
        % -7pi/8 to -5pi/8: data carriers {101}
        elseif and(d >= -7 * start, d < -5 * start)
            carrier(x) = -sqrt(2)/2 - (sqrt(2)/2)*1i;
        % -5pi/8 to -3pi/8: data carriers {110}
        elseif and(d >= -5 * start, d < -3 * start)
            carrier(x) = 0 - 1i;
        % -3pi/8 to -pi/8: data carriers {111}
        else
            carrier(x) = sqrt(2)/2 - (sqrt(2)/2)*1i;
        end
    end
end