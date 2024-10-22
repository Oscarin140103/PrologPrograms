% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que rota una
%              lista N lugares a la izquierda.
%              Utiliza la longitud de la lista para
%              manejar rotaciones mayores que la longitud.
%              Se incluye una versión comentada 
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Función para rotar una lista N lugares a la izquierda en Python.
% def rotate(lst, n):
%     n = n % len(lst)  # Maneja rotaciones mayores que la longitud
%     return lst[n:] + lst[:n]
%
% Ejemplo de uso:
% lista = ['a', 'b', 'c', 'd', 'e']
% rotated_lista = rotate(lista, 2)
% print("Lista rotada:", rotated_lista)
%
% Salida esperada:
% Lista rotada: ['c', 'd', 'e', 'a', 'b']
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Rota una lista N lugares a la izquierda.
% Utiliza la longitud de la lista para manejar rotaciones mayores que la longitud.
rotate(L, N, R) :- 
    length(L, Len), 
    N1 is N mod Len, 
    split(L, N1, L1, L2), 
    append(L2, L1, R).

% Ejemplo de uso:
% ?- rotate([a,b,c,d,e], 2, R).
% R = [c, d, e, a, b].
% ----------------------------------------------
