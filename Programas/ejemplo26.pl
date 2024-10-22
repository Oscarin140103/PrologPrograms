% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que genera todas
%              las combinaciones de K elementos seleccionados
%              de una lista dada.
%              Se incluye una versión comentada 
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Función para generar todas las combinaciones de K elementos en Python.
% from itertools import combinations
%
% def combination(k, lst):
%     return list(combinations(lst, k))  # Genera todas las combinaciones de k elementos
%
% Ejemplo de uso:
% lista = ['a', 'b', 'c', 'd']
% combs = combination(2, lista)
% print("Combinaciones de 2 elementos:", combs)
%
% Salida esperada:
% Combinaciones de 2 elementos: [('a', 'b'), ('a', 'c'), ('a', 'd'), ('b', 'c'), ('b', 'd'), ('c', 'd')]
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Genera todas las combinaciones de K elementos seleccionados de una lista dada.
combination(0, _, []).
combination(K, [H|T], [H|Comb]) :- 
    K > 0, 
    K1 is K - 1, 
    combination(K1, T, Comb).
combination(K, [_|T], Comb) :- 
    K > 0, 
    combination(K, T, Comb).

% Ejemplo de uso:
% ?- combination(2, [a, b, c, d], Comb).
% Comb = [a, b] ;
% Comb = [a, c] ;
% Comb = [a, d] ;
% Comb = [b, c] ;
% Comb = [b, d] ;
% Comb = [c, d].
% ----------------------------------------------
