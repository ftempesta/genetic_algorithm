%   Calcula el puntaje total de la solucion
%   @F: [route_sum, invalid_city, repeated_city]

function score = Fitness(F, NC)

%   Importancia sobre cada uno de los factores que influencian en el score 
%   final

%   @w1: peso uno referente a F1 - Suma total de las distancias de la ruta
%   @w2: peso dos referente a F2 - Cantidad de ciudades invalidas
%   @w3: peso tres referente a F3 - Cantidad de ciudades repetidas
    
    w1 = 0.1;
    w2 = 0.2;
    w3 = 0.3;
    
%   Puntaje total de la solucion
    score  = 0;
    if F(1) == 0
        F(1) = NC;
    end
    
    score = (F(1)) + (w2*F(2)) + (w3*F(3));
end