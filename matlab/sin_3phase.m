function ret = sin_3phase(t, f)
    % Fill in unset optional values.
    switch nargin
        case 1
            f=50;
        case 2
        otherwise
            disp('Baj van');
    end
    ua = sin(2*pi*f*t);
    ub = sin(2*pi*f*t+2*pi/3);
    uc = sin(2*pi*f*t-2*pi/3);
    ret = [ua; ub; uc];
end