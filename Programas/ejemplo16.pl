% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que elimina
%              cada n-ésimo elemento de una lista.
%              Se incluye una versión comentada 
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Función para eliminar cada n-ésimo elemento de una lista en Python.
% def drop(lst, n):
%     return [x for i, x in enumerate(lst) if (i + 1) % n != 0]
%
% Ejemplo de uso:
% lista = ['a', 'b', 'c', 'd', 'e', 'f']
% result_lista = drop(lista, 2)
% print("Lista después de eliminar cada 2-ésimo elemento:", result_lista)
%
% Salida esperada:
% Lista después de eliminar cada 2-ésimo elemento: ['a', 'c', 'e']
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Elimina cada n-ésimo elemento de una lista.
% Utiliza un contador para determinar cuándo eliminar un elemento.
drop(L, N, R) :- drop(L, N, N, R).

% Caso base: cuando la lista está vacía, el resultado es vacío.
drop([], _, _, []).

% Si el contador llega a 1, omite el primer elemento y reinicia el contador.
drop([_|T], 1, N, R) :- drop(T, N, N, R).

% Caso recursivo: disminuye el contador y conserva el elemento.
drop([H|T], K, N, [H|R]) :- K > 1, K1 is K - 1, drop(T, K1, N, R).

% Ejemplo de uso:
% ?- drop([a,b,c,d,e,f], 2, R).
% R = [a, c, e].
% ----------------------------------------------
