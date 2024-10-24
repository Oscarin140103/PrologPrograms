% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que divide una
%              lista en dos partes. La longitud de
%              la primera parte está dada por el 
%              segundo argumento.
%              Se incluye una versión comentada 
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Función para dividir una lista en dos partes en Python.
% def split(lst, n):
%     return lst[:n], lst[n:]
%
% Ejemplo de uso:
% lista = ['a', 'b', 'c', 'd', 'e']
% part1, part2 = split(lista, 2)
% print("Primera parte:", part1)
% print("Segunda parte:", part2)
%
% Salida esperada:
% Primera parte: ['a', 'b']
% Segunda parte: ['c', 'd', 'e']
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Divide una lista en dos partes.
% La longitud de la primera parte está dada por el segundo argumento.
split(L, 0, [], L).
split([H|T], N, [H|L1], L2) :- N > 0, N1 is N - 1, split(T, N1, L1, L2).

% Ejemplo de uso:
% ?- split([a,b,c,d,e], 2, L1, L2).
% L1 = [a, b],
% L2 = [c, d, e].
% ----------------------------------------------

% Predicado principal (main)
main :-
    % Definimos una lista de ejemplo
    Lista = [a, b, c, d, e],
    
    % Definimos la longitud de la primera parte
    N = 2,
    
    % Aplicamos la división de la lista
    split(Lista, N, Parte1, Parte2),
    
    % Mostramos los resultados
    write('Primera parte: '), write(Parte1), nl,
    write('Segunda parte: '), write(Parte2), nl.

% Ejemplo de uso:
% ?- main.
% Primera parte: [a, b]
% Segunda parte: [c, d, e].
