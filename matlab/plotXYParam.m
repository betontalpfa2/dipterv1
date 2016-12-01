function [  ] = plotXYParam( matrix3d, var1, var2, var3, reduceParam )
%plotXYParam Plots parametrized slices of a 3 dimensions matrix.
%   First parameter must be a 3 dimensions matrix.
%   The 2-3 parameter must be the following:
%    - One of them must an integer. This will be a fix parameter of the
%    corresponding variable.
%    - One of them must be a vector containing the values of independent
%    variable . The corresponding variabe will be the independent variable.
%    - The last one must be 'p'. The corresponding variable will be the
%    parameteron the plot.

    assert(isstruct(var1) & isstruct(var2) & isstruct(var3),...
        'All of {var1 var2, var3} must be struct containing the following fields: as, values, name');
    
    assert(strcmpi(var1.as,  'x') | strcmpi(var2.as,  'x') | strcmpi(var3.as,  'x'), 'One argument must be the independent "x" variable');
    assert(strcmpi(var1.as,  'p') | strcmpi(var2.as,  'p') | strcmpi(var3.as,  'p'), 'One argument must be the "param" variable');
    %assert(strcmpi(var1.as,  'f') | strcmpi(var2.as,  'f') | strcmpi(var3.as,  'f'), 'One argument must be the "fix" variable');

    %fixedVar = '';
    plotMat = [];
    fixName = '';
    fixValue = 0;
    if isnumeric(var1.as)
        %fixedVar = 'var1';
        fixName = var1.name;
        best_index = findNearest(var1.values, var1.as, 1);
        fixValue = var1.values(best_index);
        plotMat = matrix3d(best_index,:,:);
        plotMat = reshape(plotMat, [length(plotMat(1,:,1)), length(plotMat(1,1,:)) ]);
    end
    if isnumeric(var2.as)
        %fixedVar = 'var2';
        fixName = var2.name;
        best_index = findNearest(var2.values, var2.as, 1);
        fixValue = var2.values(best_index);
        plotMat = matrix3d(:,best_index,:);
        plotMat = reshape(plotMat, [length(plotMat(:,1,1)), length(plotMat(1,1,:)) ]);
    end
    if isnumeric(var3.as)
        %fixedVar = 'var3';
        fixName = var3.name;
        best_index = findNearest(var3.values, var3.as, 1);
        fixValue = var3.values(best_index);
        plotMat = matrix3d(:,:,best_index);
        plotMat = reshape(plotMat, [length(plotMat(:,1,1)), length(plotMat(1,:,1)) ]);
    end
    
    x = 0;
    if strcmpi(var1.as,  'x')
        x = 1;
        xStruct = var1;
    end
    if strcmpi(var2.as,  'x')
        x = 2;
        xStruct = var2;
    end
    if strcmpi(var3.as,  'x')
        x = 3;
        xStruct = var3;
    end
    
    p = 0;
    if strcmpi(var1.as,  'p')
        p = 1;
        pStruct = var1;
    end
    if strcmpi(var2.as,  'p')
        p = 2;
        pStruct = var2;
    end
    if strcmpi(var3.as,  'p')
        p = 3;
        pStruct = var3;
    end
    
    if p<x
        plotMat = plotMat';
    end
    
    if (exist('reduceParam', 'var'))
        if(reduceParam>0)
            if(length(pStruct.values)>4)
                plotMat2(:,1) = plotMat(:,1);
                plotMat2(:,2) = plotMat(:, length(pStruct.values)/2);
                plotMat2(:,3) = plotMat(:, length(pStruct.values));
                plotMat = plotMat2;
                val2(1) = pStruct.values(1);
                val2(2) = pStruct.values(length(pStruct.values)/2);
                val2(3) = pStruct.values(length(pStruct.values));
                pStruct.values = val2;
            end
        end
    end
    
    
    plot(xStruct.values, plotMat)
    
    titleStr = sprintf('Plot using %s as fix at %d', fixName, fixValue);
    title(titleStr)
    xlabel(xStruct.name)
    ylabel('Torque')
    legendCell = cell(length(pStruct.values), 1);
    for i = 1:length(pStruct.values)
        %legend(sprintf('%s = %d', pStruct.name, pStruct.values(i)));
        legendCell(i) = {sprintf('%s = %d', pStruct.name, pStruct.values(i))};
    end
    
    legend(legendCell)
    grid
    %output_args = plotMat;
end

