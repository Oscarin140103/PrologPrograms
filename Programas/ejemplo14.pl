% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que duplica los
%              elementos de una lista.
%              Se incluye una versión comentada 
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Función para duplicar los elementos de una lista en Python.
% def dupli(lst):
%     return [x for item in lst for x in (item, item)]
%
% Ejemplo de uso:
% lista = ['a', 'b', 'c']
% duplicated_lista = dupli(lista)
% print("Lista duplicada:", duplicated_lista)
%
% Salida esperada:
% Lista duplicada: ['a', 'a', 'b', 'b', 'c', 'c']
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Duplica los elementos de una lista.
% Caso base: la lista vacía se mantiene vacía.
dupli([], []).

% Caso recursivo: duplica el primer elemento y continúa con el resto.
dupli([H|T], [H,H|R]) :- dupli(T, R).

% Ejemplo de uso:
% ?- dupli([a,b,c], R).
% R = [a, a, b, b, c, c].
% ----------------------------------------------

% Predicado principal (main)
main :-
    % Definimos una lista de ejemplo
    Lista = [a, b, c],
    
    % Aplicamos la duplicación de elementos
    dupli(Lista, Resultado),
    
    % Mostramos el resultado
    write('Lista duplicada: '), write(Resultado), nl.

% Ejemplo de uso:
% ?- main.
% Lista duplicada: [a, a, b, b, c, c].
