% ===============================================
% Autor: Juan Pérez
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que modifica la
%              codificación Run-Length de una lista.
%              Se incluye una versión comentada 
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Función para modificar la codificación Run-Length de una lista en Python.
% def encode_modified(lst):
%    if not lst:
%        return []
%
%    result = []
%    count = 1
%
%    for i in range(1, len(lst)):
%        if lst[i] == lst[i - 1]:
%            count += 1
%        else:
%            if count == 1:
%                result.append(lst[i - 1])
%            else:
%                result.append([count, lst[i - 1]])
%            count = 1
%
%    if count == 1:
%        result.append(lst[-1])
%    else:
%        result.append([count, lst[-1]])
%
%    return result
%
% Ejemplo de uso:
% lista = ['a', 'a', 'b', 'c', 'c', 'c']
% encoded_lista = encode_modified(lista)
% print("Lista codificada modificada:", encoded_lista)

% Salida esperada:
% Lista codificada modificada: [[2, 'a'], 'b', [3, 'c']]
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Modifica la codificación Run-Length de una lista.
% Si un elemento no tiene duplicados, se mantiene sin empaquetar.

% Codifica la lista y luego la modifica.
encode_modified(L, R) :- encode(L, Enc), modify(Enc, R).

% Caso base: lista vacía.
modify([], []).

% Si hay solo un elemento, agrégalo directamente.
modify([[1,X]|T], [X|R]) :- modify(T, R).

% Si hay más de un elemento, mantén el formato (N, X).
modify([[N,X]|T], [[N,X]|R]) :- N > 1, modify(T, R).

% Ejemplo de uso:
% ?- encode_modified([a,a,b,c,c,c], R).
% R = [[2, a], b, [3, c]].
% ----------------------------------------------
