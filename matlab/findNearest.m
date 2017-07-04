function [ best_index ] = findNearest( vect, elem, verbose )
%findNearest finds the nearest element in the vector.
%   If verbose is not null and if the nearest element is not match exactely
%   the given value it will print out a warning message.

    if length(vect) < 2
        best_index = length(vect);
        return
    end

    best_match  = abs(vect(1)-elem);
    best_index  = 1;
    if (best_match == 0)
        return
    end
    for i = 2:length(vect)
       if(best_match > abs(vect(i)-elem))
           best_match = abs(vect(i)-elem);
           best_index = i;
           if (best_match == 0)
               return
           end
       end
    end
    
    if exist('verbose', 'var')
        if(verbose)
            fprintf('Could not found the element exactely. The nearest element is: %f', vect(i));
        end
    end

end

