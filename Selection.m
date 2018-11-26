function Sel = Selection(Vectores,porcentaje,distanciasTmp)
    %Cantidad de vectores
    cf = size(Vectores,1); % Cantidad de filas
    % Lugar de los seleccionados
    Sel = [];
    %Calculando las distancias con la funcion distanciaRuta
    % Dist = [];
    % for i=1:cf
    % Dist = [Dist,distanciaRuta(Vectores(i),matrizDistanciaLab1)];
    % end
    % Dist = ;
    % Matris Vector - Distancia ordenadas por la Distancia de manera
    % Ascendente
    %Ordenados = sortrows(transpose([Vectores,Dist]),2);

    poblacionScores = [Vectores,distanciasTmp];
    cols = size(poblacionScores,2);
    Ordenados = sortrows(poblacionScores,cols);
    % Cantidad a seleccionar
    cs = round(porcentaje * cf);
    % Posicion del ultimo seleccionado
    pu = 1;
    % Cantidad de selccionados
    cSel = 1;
    % Guardar el primero como selccionado
    Sel = [Sel;Ordenados(1,:)];
    % --- Paso a seleccionar y omitir iguales ---.
    pv = 2; % Posicion del vector siguiente
    while (cSel < cs && pv <= cf)
        % comparacon segun distancias
        if Ordenados(pu,cols) == Ordenados(pv,cols)
            % sospecha que los vectores son iguales
            % si son iguales los vectores
            cantDif = diferencias(Ordenados(pu,cols),Ordenados(pv,cols));
            if cantDif == 0
                pv = pv + 1; % no se guarda y se va al siguiente
            else
                % Es distinto entonces lo guardamos
                Sel = [Sel;Ordenados(pv,:)]; % Agraga
                pu = pv; %% la posicion nueva
                pv = pv + 1; %% siguiente
                cSel = cSel + 1; %% Registrar uno en cantidad de Seleccionados
            end
            else
                % es diferente al siguiente entanto se agrega
                Sel = [Sel;Ordenados(pv,:)]; % Agraga
                pu = pv; %% la posicion nueva
                pv = pv + 1; %% siguiente
                cSel = cSel + 1; %% Registrar uno en cantidad de Seleccionados
            end
    end
end