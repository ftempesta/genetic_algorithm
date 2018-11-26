% Performs mutation in random individuals

% @parameter population: population that will mutate
% @parameter theta: rate of individuals who will be mutated
% @return mutation: mutated population

function mutation = Mutation(population, theta)

    %[row,col]
    [r,c] = size(population);
    
    individuals_mutated = round(r*theta);
    
    % individuals selected for mutation
    selected_individuals = randi([1 , r], 1 , individuals_mutated);

    mutation = [];
    
    % iteration over mutated individuals
    for i = selected_individuals 
        
        % genes selected for mutation
        selected_gene = randi([1 , c], 1, 1) ;
        
        % population selected for mutation
        selected_population= population(selected_individuals, : );
        
        % mutation
        selected_population(selected_gene) = ~selected_population(selected_gene); 
        
        % aggregates mutated individuals to the population
        mutation = [mutation;selected_population];
    end
end