% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que elimina el
%              k-ésimo elemento de una lista.
%              El índice K debe ser mayor que 0.
%              Se incluye una versión comentada 
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Función para eliminar el k-ésimo elemento de una lista en Python.
% def remove_at(lst, k):
%     if k < 1 or k > len(lst):
%         raise IndexError("El índice está fuera de rango.")
%     return lst[:k-1] + lst[k:]  # Retorna la lista sin el k-ésimo elemento
%
% Ejemplo de uso:
% lista = ['a', 'b', 'c', 'd', 'e']
% removed_lista = remove_at(lista, 3)
% print("Lista después de eliminar el 3-ésimo elemento:", removed_lista)
%
% Salida esperada:
% Lista después de eliminar el 3-ésimo elemento: ['a', 'b', 'd', 'e']
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Elimina el k-ésimo elemento de una lista.
% El índice K debe ser mayor que 0.
remove_at(X, [X|T], 1, T).
remove_at(X, [H|T], K, [H|R]) :- K > 1, K1 is K - 1, remove_at(X, T, K1, R).

% Ejemplo de uso:
% ?- remove_at(X, [a,b,c,d,e], 3, R).
% X = c,
% R = [a, b, d, e].
% ----------------------------------------------

% Predicado principal (main)
main :-
    % Definimos una lista de ejemplo
    Lista = [a, b, c, d, e],
    
    % Definimos el índice del elemento a eliminar
    K = 3,
    
    % Aplicamos la eliminación del k-ésimo elemento
    remove_at(ElementoEliminado, Lista, K, Resultado),
    
    % Mostramos el resultado
    write('Elemento eliminado: '), write(ElementoEliminado), nl,
    write('Lista después de eliminar el '), write(K), write('-ésimo elemento: '), write(Resultado), nl.

% Ejemplo de uso:
% ?- main.
% Elemento eliminado: c
% Lista después de eliminar el 3-ésimo elemento: [a, b, d, e].
