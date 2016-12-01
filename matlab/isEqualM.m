function [ output_args ] = isEqualM( M1, M2, peakDiff )
%isEqualM Compare two matrices up to 3 dimension.
%   The first two arguments (M1 and M2) are matrices to be compared.
%   The dimension if these matrices must be equal.
%   The third argument is the threshold. If the maximum value of the
%   difference of the two matrices is below the threshold the function
%   returns true. Otherwise false.

    diff = M1 - M2;
    diff = abs(diff);
    diff = max(diff);
    diff = max(diff);
    diff = max(diff);

    output_args =  diff < peakDiff;

end

