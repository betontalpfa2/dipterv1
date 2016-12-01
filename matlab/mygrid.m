
theta = -pi/4;
rotate = [cos(theta), -sin(theta);
    sin(theta), cos(theta)];

distance = 55;
fine = 2.5;
xborder = 40;

xgv = -300:distance:-xborder;
ygv = 1:distance:600;
[X,Y] = ndgrid(xgv,ygv);
x1 = reshape(X, [1, numel(X)]);
y1 = reshape(Y, [1, numel(Y)]);

xgv = -xborder:fine:xborder;
ygv = 1:fine*2:600;
[X,Y] = ndgrid(xgv,ygv);

for i = 1:size(X, 2)
    if mod(i, 2)
        X(:,i)=flipud(X(:,i));
        %Y(:,2)=flipud(Y(:,i));
    end
end

x2 = reshape(X, [1, numel(X)]);
y2 = reshape(Y, [1, numel(Y)]);

xgv = xborder:distance:300;
ygv = 1:distance:600;
[X,Y] = ndgrid(xgv,ygv);
x3 = reshape(X, [1, numel(X)]);
y3 = reshape(Y, [1, numel(Y)]);

x = [x1, x2, x3];
y = [y1, y2, y3];

space = [x;y];
space = rotate * space;

% for i = 1: length(space(1,:))
%     %space(:,i);
%     v = dot([1;0] - [0;0], space(:,i));
%     if v<0
%         space(:,i) = [];
%         i = i-1;
%     end
% end

%v = dot(Q - P, N);


% grdx = reshape(X, [1, numel(X)]);
% grdy = reshape(Y, [1, numel(Y)]);
figure(4)
scatter3(space(1,:), space(2,:), ones(1, numel(x)))


hexaGrid = 0;
if hexaGrid
    grdx = meshgrid(-4:3);
    grdy = meshgrid(-4:3);

    a = 1;
    mlt = sqrt(0.75);%(0.25+a*a)/a*a;

    for i = 1:length(grdx(1,:))
        if(mod(i, 2))
            grdx(i,:) = grdx(i,:)+.5
        end
    end

    grdy = grdy.*mlt;

    grdx = reshape(grdx', [1, 64]);
    grdy = reshape(grdy, [1, 64]);

    scatter3(grdx, grdy, ones(1, 64))
    % plot(grd, 'o')
end