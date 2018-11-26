% To make the crossover

% @parameter matrix: matrix with the population
% @return crossover: new individuals resulting from the crossover

function crossover = Crossover(matrix)

    crossover =[];
    
    % [row,col]
    [r,c] = size(matrix);
    
    % randomly defines individuals who will be crossed
    [cross_vector] = FeasibleVector(r);

    i=1;
    loop=1;
    
    while loop==1
        % individuals who will be crossed
        a = cross_vector(i);
        b = cross_vector(i+1);

        b1 = matrix(a,1:floor(end*0.2));
        b2 = matrix(b,floor(end*0.2) + 1:end);
        
        new_individual = [b1, b2];
        
        crossover =[crossover;new_individual];
    
        % jumps to the next individuals who will be crossed
        i = i + 2;
        
        if i > r - 1
            break
        end
    end
end