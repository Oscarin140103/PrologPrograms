% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que inserta un
%              elemento en una lista en la posición 
%              dada. El índice K debe ser mayor que 0.
%              Se incluye una versión comentada 
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Función para insertar un elemento en una lista en la posición dada en Python.
% def insert_at(lst, x, k):
%     if k < 1:
%         raise IndexError("El índice debe ser mayor que 0.")
%     return lst[:k-1] + [x] + lst[k-1:]  # Inserta el elemento en la posición k-1
%
% Ejemplo de uso:
% lista = ['a', 'b', 'd', 'e']
% updated_lista = insert_at(lista, 'c', 3)
% print("Lista después de insertar el elemento:", updated_lista)
%
% Salida esperada:
% Lista después de insertar el elemento: ['a', 'b', 'c', 'd', 'e']
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Inserta un elemento en una lista en la posición dada.
% El índice K debe ser mayor que 0.
insert_at(X, L, 1, [X|L]).
insert_at(X, [H|T], K, [H|R]) :- K > 1, K1 is K - 1, insert_at(X, T, K1, R).

% Ejemplo de uso:
% ?- insert_at(c, [a,b,d,e], 3, R).
% R = [a, b, c, d, e].
% ----------------------------------------------
