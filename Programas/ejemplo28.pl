% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que ordena una lista de listas
%              de acuerdo con la longitud de las sublistas.
%              Se incluye una versión comentada 
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Función para ordenar una lista de listas según la longitud de las sublistas en Python.
% def lsort(lst):
%     return sorted(lst, key=len)  # Ordena según la longitud de las sublistas
%
% Ejemplo de uso:
% listas = [[1, 2, 3], [1], [1, 2], [1, 2, 3, 4]]
% listas_ordenadas = lsort(listas)
% print("Listas ordenadas por longitud:", listas_ordenadas)
%
% Salida esperada:
% Listas ordenadas por longitud: [[1], [1, 2], [1, 2, 3], [1, 2, 3, 4]]
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Ordena una lista de listas de acuerdo con la longitud de las sublistas.
lsort(L, S) :- 
    map_list_to_pairs(length, L, P),  % Crea pares (longitud, sublista)
    keysort(P, SP),                   % Ordena según la longitud (clave)
    pairs_values(SP, S).              % Extrae las sublistas ordenadas

% Ejemplo de uso:
% ?- lsort([[1, 2, 3], [1], [1, 2], [1, 2, 3, 4]], S).
% S = [[1], [1, 2], [1, 2, 3], [1, 2, 3, 4]].
% ----------------------------------------------

% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que ordena una lista de listas
%              de acuerdo con la longitud de las sublistas.
% ===============================================

% Ordena una lista de listas de acuerdo con la longitud de las sublistas.
lsort(L, S) :- 
    map_list_to_pairs(length, L, P),  % Crea pares (longitud, sublista)
    keysort(P, SP),                   % Ordena según la longitud (clave)
    pairs_values(SP, S).              % Extrae las sublistas ordenadas

% Predicado principal (main)
main :-
    % Definimos la lista de listas a ordenar
    Listas = [[1, 2, 3], [1], [1, 2], [1, 2, 3, 4]],
    
    % Llamamos al predicado lsort para obtener las listas ordenadas
    lsort(Listas, ListasOrdenadas),
    
    % Mostramos las listas ordenadas
    write('Listas ordenadas por longitud: '), write(ListasOrdenadas), nl.

% Ejemplo de uso:
% ?- main.
% Listas ordenadas por longitud: [[1], [1, 2], [1, 2, 3], [1, 2, 3, 4]].
% ----------------------------------------------
