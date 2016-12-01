% fill test matrices


% open_system('om_M');
X1Sw = linspace(0, 20, 50); 
%interNum = length(omega_supplySweep);

X2Sw = linspace(0, 20, 50);

X3Sw = linspace(0, 20, 50);

resultDim = [length(X1Sw), length(X2Sw), length(X3Sw)];
testMatrice = repmat(12, resultDim); % initialize 3x3 result matrix

%arr = zeros(1, interNum);
for i = 1:length(X1Sw)
    
    for j = 1:length(X2Sw)
        
        for k = 1:length(X3Sw)
            x1 = X1Sw(i);
            x2 = X2Sw(j);
            x3 = X3Sw(k);
            testMatrice(i, j, k) = x1 + sin(x2) + 2*sin(2*x3);

           % h1 = plot(x1); hold on;
           % h2 = plot(x2);
            %set(h1,'color',[0 1 0]); 
            %set(h2,'color',[0 0 1]);
            %legend('x1', 'x2');
        end
    end
end