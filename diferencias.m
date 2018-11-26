%funcion diferencias
%cantidad de diferencias entre dos vectores de igual largo
function [cantDif] = diferencias(va,vb)
    cantDif = 0; % cantidad de diferencias
    cc = size(va,2); % Cantidad de columnas
    for i=1:cc
        % Si son diferentes
        if va(i) ~= vb(i)
        % registrar una diferencia
            cantDif = cantDif + 1;
        end
    end
end


