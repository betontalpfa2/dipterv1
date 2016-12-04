numOfCoils = 3;
coilsDirections = ones(numOfCoils,1);
ang = 2*pi/numOfCoils;
lengths = [1; 2; 3];
vects = ones(numOfCoils,1);
for i = 1:numOfCoils
    coilsDirections(i) = exp(1j*ang*(i-1));
end
for i = 1:numOfCoils
    vects(i) = lengths(i) * coilsDirections(i);
end

M_abc2ab0  = [1, -0.5, -0.5; 0, sqrt(3)/2, -sqrt(3)/2;  0.5, 0.5, 0.5]
res = M_abc2ab0 * lengths
vects(numOfCoils+1) = sum(vects);
% R=ceil(max(m)); r=R+0.3;
% polar(0,R), axis(r*[-1 1 -1 1])
% hold on
figure(1);
compass(vects);
%hold off

figure(2);

compass(+res(1)+res(2)*j);