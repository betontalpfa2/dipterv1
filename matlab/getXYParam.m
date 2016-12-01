function [ output_args ] = getXYParam( matrix3d, var1, var2, var3 )
%getXYParam Returns parametrized slices of a 3 dimensions matrix.
%   First parameter must be a 3 dimensions matrix.
%   The 2-3 parameter must be the following:
%    - One of them must an integer. This will be a fix parameter of the
%    corresponding variable.
%    - One of them must be 'x'. The corresponding variabe will be the
%    independent variable.
%    - The last one must be 'p'. The corresponding variable will be the
%    parameteron the plot.

    assert(strcmpi(var1,  'x') | strcmpi(var2,  'x') | strcmpi(var3,  'x'), 'One argument must be the "x" variable');
    assert(strcmpi(var1,  'p') | strcmpi(var2,  'p') | strcmpi(var3,  'p'), 'One argument must be the "param" variable');
    % assert(strcmpi(var1,  'p') | strcmpi(var2,  'p') | strcmpi(var3,  'p'));

    fixedVar = '';
    plotMat = [];
    plotMat2 = [];
    if isnumeric(var1)
        assert(strcmpi(fixedVar,  ''), 'Only one fix variable is supported.')
        fixedVar = 'var1';
        plotMat = matrix3d(var1,:,:);
        plotMat = reshape(plotMat, [length(plotMat(1,:,1)), length(plotMat(1,1,:)) ]);
    end
    if isnumeric(var2)
        assert(strcmpi(fixedVar,  ''), 'Only one fix variable is supported.')
        fixedVar = 'var2';
        plotMat = matrix3d(:,var2,:);
        plotMat = reshape(plotMat, [length(plotMat(:,1,1)), length(plotMat(1,1,:)) ]);
    end
    if isnumeric(var3)
        assert(strcmpi(fixedVar,  ''), 'Only one fix variable is supported.')
        fixedVar = 'var3';
        plotMat = matrix3d(:,:,var3);
        plotMat = reshape(plotMat, [length(plotMat(:,1,1)), length(plotMat(1,:,1)) ]);
    end
    
    x = 0;
    if strcmpi(var1,  'x')
        x = 1;
    end
    if strcmpi(var2,  'x')
        x = 2;
    end
    if strcmpi(var3,  'x')
        x = 3;
    end
    
    p = 0;
    if strcmpi(var1,  'p')
        p = 1;
    end
    if strcmpi(var2,  'p')
        p = 2;
    end
    if strcmpi(var3,  'p')
        p = 3;
    end
    
    if p<x
        plotMat = plotMat';
    end
    
%     if strcmpi(var1, 'p')
%         plotMat2 = zeros(length(plotMat(:,1)), length(plotMat(1,:)));
%         for i = 1:length(plotMat(:,1));
%             vect = plotMat(i,:);
%             plotMat2(i,:) = reshape(vect, [1, size(vect)]);
%             
%         end
%     end
%     if strcmpi(var3, 'p')
%         plotMat2 = zeros(length(plotMat(1,:)), length(plotMat(:,1)));
%         for i = 1:length(plotMat(1,:));
%             vect = plotMat(:,i);
%             plotMat2(i,:) = reshape(vect, [1, size(vect)]);
%         end
%     end
    
    output_args = plotMat;
    % strcmp(fix,  '')
end

