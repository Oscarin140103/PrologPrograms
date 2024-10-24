% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que duplica los
%              elementos de una lista un número dado
%              de veces.
%              Se incluye una versión comentada 
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Función para duplicar los elementos de una lista un número dado de veces en Python.
% def dupli(lst, n):
%     result = []
%     for item in lst:
%         result.extend([item] * n)  # Duplica el elemento n veces
%     return result
%
% Ejemplo de uso:
% lista = ['a', 'b', 'c']
% duplicated_lista = dupli(lista, 3)
% print("Lista duplicada:", duplicated_lista)
%
% Salida esperada:
% Lista duplicada: ['a', 'a', 'a', 'b', 'b', 'b', 'c', 'c', 'c']
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Duplica los elementos de una lista un número dado de veces.
% Caso base: la lista vacía se mantiene vacía.
dupli([], _, []).

% Caso recursivo: duplica el primer elemento N veces y continúa con el resto.
dupli([H|T], N, R) :- duplicate(H, N, D), dupli(T, N, R1), append(D, R1, R).

% Crea una lista con N repeticiones del elemento X.
duplicate(_, 0, []).

duplicate(X, N, [X|R]) :- N > 0, N1 is N - 1, duplicate(X, N1, R).

% Ejemplo de uso:
% ?- dupli([a,b,c], 3, R).
% R = [a, a, a, b, b, b, c, c, c].
% ----------------------------------------------

% Predicado principal (main)
main :-
    % Definimos una lista de ejemplo
    Lista = [a, b, c],
    
    % Definimos el número de repeticiones
    N = 3,
    
    % Aplicamos la duplicación de elementos N veces
    dupli(Lista, N, Resultado),
    
    % Mostramos el resultado
    write('Lista duplicada: '), write(Resultado), nl.

% Ejemplo de uso:
% ?- main.
% Lista duplicada: [a, a, a, b, b, b, c, c, c].
