% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que codifica una
%              lista usando codificación Run-Length.
%              Se incluye una versión comentada 
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Función para codificar una lista usando codificación Run-Length en Python.
% def encode_direct(lst):
%     if not lst:
%         return []
%     
%     result = []
%     count = 1
%
%     for i in range(1, len(lst)):
%         if lst[i] == lst[i - 1]:
%             count += 1
%         else:
%             result.append([count, lst[i - 1]])
%             count = 1
%
%     result.append([count, lst[-1]])  % Agrega el último elemento
%     return result
%
% Ejemplo de uso:
% lista = ['a', 'a', 'b', 'c', 'c', 'c']
% encoded_lista = encode_direct(lista)
% print("Lista codificada:", encoded_lista)
%
% Salida esperada:
% Lista codificada: [[2, 'a'], [1, 'b'], [3, 'c']]
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Codifica directamente una lista usando codificación Run-Length.
% Cuenta cuántos elementos consecutivos son iguales.

encode_direct([], []).

% Si hay un elemento X, cuenta cuántas veces aparece consecutivamente.
encode_direct([X|Xs], [[N,X]|R]) :- count(X, [X|Xs], N, Rest), encode_direct(Rest, R).

% Cuenta cuántos elementos consecutivos son iguales.
count(_, [], 0, []).

count(X, [X|Xs], N, Rest) :- count(X, Xs, N1, Rest), N is N1 + 1.

count(X, [Y|Ys], 0, [Y|Ys]) :- X \= Y.

% Ejemplo de uso:
% ?- encode_direct([a,a,b,c,c,c], R).
% R = [[2, a], [1, b], [3, c]].
% ----------------------------------------------
