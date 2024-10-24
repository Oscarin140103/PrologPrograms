% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que ordena una lista de listas
%              de acuerdo con la frecuencia de la longitud de las sublistas.
%              Se incluye una versión comentada 
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Función para ordenar una lista de listas según la frecuencia de la longitud de las sublistas en Python.
% from collections import Counter
%
% def length_frequency(lst):
%     lengths = [len(sublist) for sublist in lst]  # Lista de longitudes
%     frequency = Counter(lengths)  # Cuenta la frecuencia de cada longitud
%     return sorted(lst, key=lambda x: (frequency[len(x)], len(x)))
%
% Ejemplo de uso:
% listas = [[1, 2, 3], [1], [1, 2], [4, 5], [1, 2, 3, 4]]
% listas_ordenadas = length_frequency(listas)
% print("Listas ordenadas por frecuencia de longitud:", listas_ordenadas)
%
% Salida esperada:
% Listas ordenadas por frecuencia de longitud: [[1, 2, 3], [1, 2, 3, 4], [1], [1, 2], [4, 5]]
% ----------------------------------------------

% -------- Código en Prolog --------------------
% length_frequency.pl
% Ordena una lista de listas de acuerdo con la frecuencia de la longitud de las sublistas.

% Codifica la lista de pares (Longitud, Frecuencia).
encode([], []).
encode([_ - F | P], [F | R]) :- 
    encode(P, R).

% Calcula la frecuencia de la longitud de las sublistas.
length_frequency(L, F) :- 
    map_list_to_pairs(length, L, P), 
    msort(P, SP), 
    encode(SP, F).

% main: Ejemplo de uso
main :-
    ListOfLists = [[a, b], [c], [d, e], [f, g, h], [i]],
    length_frequency(ListOfLists, Frequencies),
    write('Frecuencias de longitud: '), write(Frequencies), nl.

:- initialization(main).
