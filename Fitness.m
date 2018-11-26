%   Calcula el puntaje total de la solucion
%   @F: [route_sum, invalid_city, repeated_city]

function score = Fitness(normalized_vector)

%   Importancia sobre cada uno de los factores que influencian en el score 
%   final

%   @w1: peso uno referente a F1 - Suma total de las distancias de la ruta
%   @w2: peso dos referente a F2 - Cantidad de ciudades invalidas
%   @w3: peso tres referente a F3 - Cantidad de ciudades repetidas
    
    w1 = 0.1;
    w2 = 0.4;
    w3 = 0.5;
    
%   Puntaje total de la solucion
    score  = 0;
    final_score = [];
    
    [r,c] = size(normalized_vector);
    
    for i = 1:r
        n1 = normalized_vector(i,1)*w1
        n2 = (normalized_vector(i,2) + normalized_vector(i,1)) * w2
        n3 = (normalized_vector(i,3) + normalized_vector(i,1)) * w3
        score = n1 + n2 + n3;
        final_score = [final_score; score];
    end
end