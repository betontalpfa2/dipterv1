function space = gaussSpace(numOfout, mu, sig, interval)
%gaussSpace Summary of this function goes here
%   Detailed explanation goes here
    
    fromx    = -sig*3 + mu;
    tox      = sig*3 + mu;
    if exist('interval', 'var')
        fromx    = interval(1);
        tox      = interval(length(interval));
        sig = (tox-fromx)/6;
        mu=(tox+fromx)/2;
    end
    
    fromy = normcdf(fromx, mu, sig);
    toy = normcdf(tox, mu, sig);
    %y = normcdf(interval, mu, sig)
    
    prop = fromy;
    yDistance = abs(toy - fromy)/(numOfout-1);
    
    space = zeros(numOfout, 1);
    for i = 1:numOfout
        space(i) = norminv(prop, mu, sig);
        prop = prop + yDistance;
    end
    
end

