function unit_circle()
    angle = linspace(0,2*pi, 360);
    x = cos(angle);
    y = sin(angle);
    plot(x, y, 'g'); hold on;
    plot(0,0,'r+');
    plot(1,0,'r.');
    plot(sqrt(2)/2,sqrt(2)/2,'r.');
    plot(0,1,'r.');
    plot(-sqrt(2)/2,sqrt(2)/2,'r.');
    plot(-1,0,'r.');
    plot(-sqrt(2)/2,-sqrt(2)/2,'r.');
    plot(0,-1,'r.');
    plot(sqrt(2)/2,-sqrt(2)/2,'r.');
    grid on;
    xlabel('Real');
    ylabel('Imaginary');
    xlim([-1.5 1.5]);
    ylim([-1.5 1.5]);
    axis('equal');
end