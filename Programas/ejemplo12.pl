% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que decodifica una
%              lista codificada mediante Run-Length.
%              Se incluye una versión comentada 
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Función para decodificar una lista codificada mediante Run-Length en Python.
% def decode(lst):
%     result = []
%     for item in lst:
%         if isinstance(item, list):  % Si es un par [N, X]
%             N, X = item
%             result.extend([X] * N)  % Expande X N veces
%         else:
%             result.append(item)  % Si es un elemento único
%     return result
%
% Ejemplo de uso:
% lista_codificada = [[2, 'a'], 'b', [3, 'c']]
% decoded_lista = decode(lista_codificada)
% print("Lista decodificada:", decoded_lista)
%
% Salida esperada:
% Lista decodificada: ['a', 'a', 'b', 'c', 'c', 'c']
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Decodifica una lista codificada mediante Run-Length.
% Expande cada par (N, X) en una lista con N elementos X.

decode([], []).

% Si el elemento es un par (N, X), lo expande en una lista de longitud N.
decode([[N,X]|T], R) :- decode(T, R1), expand(X, N, E), append(E, R1, R).

% Expande un elemento X en una lista de longitud N.
expand(_, 0, []).

expand(X, N, [X|T]) :- N > 0, N1 is N - 1, expand(X, N1, T).

% Ejemplo de uso:
% ?- decode([[2,a], b, [3,c]], R).
% R = [a, a, b, c, c, c].
% ----------------------------------------------
