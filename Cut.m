% Corta soluciones que no son buenas para el problema 
% @vector_solution: vector solucion
% @n_city: numero de ciudades 

function [F] = Cut(vector_solution, n_city)

load('ciudadesNueva.mat');
    
    [r,c] = size(vector_solution);

%   F1: Suma total de las distan_cityias de la ruta
    vector_route_sum = [];
    F = [];
    
    for i = 1:r
        individual_route_sum = 0;
        unvisited_city = 0;
        repeated_city = 0;
    
    %   F2: Cantidad de ciudades invalidas
        invalid_city = 0;

    %   F3: Cantidad de ciudades repetidas
        repetition = zeros(1,c);
        
        for j=1:c
%             vector_solution(i,:);
            if vector_solution(i,j) == 0 || vector_solution(i,j) > n_city
                invalid_city = invalid_city + 1;
                individual_route_sum = -1;
            end

            if invalid_city == 0
            %   Verifica si hay ciudades repetidas
                repetition(vector_solution(i,j)) = repetition(vector_solution(i,j)) + 1;  
            end
        end
    
        for j=1:n_city
        %   Verifica numero de ciudades repetidas o no visitadas
            if repetition(j) == 0
                unvisited_city = unvisited_city + 1;
            else 
                if repetition(j) > 1
                    repeated_city = repeated_city + 1;
                    individual_route_sum = -1;
                end
            end
        end
        
        for j=1:n_city
            if unvisited_city == 0 && repeated_city == 0 && invalid_city == 0

            %   Calcula la suma total de la ruta
                if j ~= n_city
                    city_a = vector_solution(i,j);
                    city_b = vector_solution(i,j+1);
                else
                    city_a = vector_solution(i,j);
                    city_b = vector_solution(i,1);
                end

                distan_citye_ab =  matrizDistanciaLab1(city_a,city_b);
                individual_route_sum = individual_route_sum + distan_citye_ab;
                
            end 
        end
        [item] = [individual_route_sum, invalid_city, repeated_city, 0];
        F = [F; item];
        vector_route_sum = [vector_route_sum;individual_route_sum];
        
%     
    end
    

    
%      
% 
%     if invalid_city == 0 && repeated_city == 0
%         F = [1 0 0 individual_route_sum]
%     else 
%         if individual_route_sum == 0 && repeated_city == 0
%            F = [0 1 0 invalid_city]
%         else
%             if individual_route_sum == 0 && invalid_city == 0
%                 F = [0 0 1 repeated_city]
%             end
%         end
%     end
end