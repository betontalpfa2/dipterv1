numOfCoils = 5;
coilsDirections = ones(numOfCoils,1);
ang = 2*pi/numOfCoils;
lengths = [1, 2, 3, 4, 5];
vects = ones(numOfCoils,1);
for i = 1:numOfCoils
    coilsDirections(i) = exp(1j*ang*i);
end
for i = 1:numOfCoils
    vects(i) = lengths(i) * coilsDirections(i);
end

vects(numOfCoils+1) = sum(vects);
% R=ceil(max(m)); r=R+0.3;
% polar(0,R), axis(r*[-1 1 -1 1])
% hold on
compass(vects);
%hold off