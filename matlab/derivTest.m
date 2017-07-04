
% d1 = zeros(length(lastX), 1);
% for i = 2: length(lastX)-1
%     d1(i) = lastX(i+1)-lastX(i-1);
% end
% d2 = zeros(length(d1), 1);
% for i = 2: length(d1)-1
%     d2(i) = d1(i+1)-d1(i-1);
% end
% 
% d1
% d2

%cnd = 1./exp(-[1:208]/12.9);
%test = (x1-x1(208)).*cnd';
%plot([test,cnd'])
%plot(test)

interval = x1true(300:800);
a = real(fft(interval));

x0 = a(1)/length(a);

fprintf('Igazi %f\n', x1true(1294));
fprintf('FFTvel %f\n', x0);

d1 = diff(interval);
d2 = diff(d1);
[m, idx ] = min(abs(d2));

x0 = interval(idx+1);
fprintf('d2/vel %f\n', x0);


