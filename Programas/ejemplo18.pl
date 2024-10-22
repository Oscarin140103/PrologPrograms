% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que extrae una
%              porción de una lista, dado un rango.
%              Los índices I y K deben ser mayores que 0.
%              Se incluye una versión comentada 
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Función para extraer una porción de una lista, dado un rango en Python.
% def slice(lst, start, length):
%     return lst[start - 1:start - 1 + length]
%
% Ejemplo de uso:
% lista = ['a', 'b', 'c', 'd', 'e']
% portion = slice(lista, 2, 3)
% print("Porción extraída:", portion)
%
% Salida esperada:
% Porción extraída: ['b', 'c', 'd']
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Extrae una porción de una lista, dado un rango.
% Los índices I y K deben ser mayores que 0.
slice([H|_], 1, 1, [H]).
slice([H|T], 1, K, [H|R]) :- K > 1, K1 is K - 1, slice(T, 1, K1, R).
slice([_|T], I, K, R) :- I > 1, I1 is I - 1, K1 is K - 1, slice(T, I1, K1, R).

% Ejemplo de uso:
% ?- slice([a,b,c,d,e], 2, 3, R).
% R = [b, c, d].
% ----------------------------------------------
