% Corta soluciones que no son buenas para el problema 
% @solution: vector solucion
% @NC: numero de ciudades 

function [F] = Cut(solution, NC)

load('ciudadesNueva.mat');

%   F1: Suma total de las distancias de la ruta
    route_sum = 0;
    
%   F2: Cantidad de ciudades invalidas
    invalid_city = 0;
    
%   F3: Cantidad de ciudades repetidas
    repetition = zeros(1,NC);
    
    for i=1:NC
        
%         solution(i)
        
         %   Verifica ciudades invalidas

        if solution(i) == 0 || solution(i) > NC
            invalid_city = invalid_city + 1;
        end
        
        if invalid_city == 0
        %   Verifica si hay ciudades repetidas
            repetition(solution(i)) = repetition(solution(i)) + 1;   
        end
        
    end
    
    unvisited_city = 0;
    repeated_city = 0;
    
    for i=1:NC
    %   Verifica numero de ciudades repetidas o no visitadas
        if repetition(i) == 0
            unvisited_city = unvisited_city + 1;
        else 
            if repetition(i) > 1
                repeated_city = repeated_city + 1;
            end
        end
    end
    
    for i=1:NC
        if unvisited_city == 0 && repeated_city == 0 && invalid_city == 0
            
        %   Calcula la suma total de la ruta
            if i ~= NC
                city_a = solution(i);
                city_b = solution(i+1);
            else
                city_a = solution(i);
                city_b = solution(1);
            end

            distance_ab =  matrizDistanciaLab1(city_a,city_b);
            route_sum = route_sum + distance_ab;
        end 
    end   
    
     F = [route_sum, invalid_city, repeated_city];

%     if invalid_city == 0 && repeated_city == 0
%         F = [1 0 0 route_sum]
%     else 
%         if route_sum == 0 && repeated_city == 0
%            F = [0 1 0 invalid_city]
%         else
%             if route_sum == 0 && invalid_city == 0
%                 F = [0 0 1 repeated_city]
%             end
%         end
%     end
end