% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que crea una lista
%              con todos los enteros dentro de un rango dado.
%              Se incluye una versión comentada 
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Función para crear una lista con todos los enteros dentro de un rango dado en Python.
% def range(start, end):
%     return list(range(start, end + 1))  # Incluye el final en el rango
%
% Ejemplo de uso:
% lista = range(3, 7)
% print("Lista de enteros en el rango:", lista)
%
% Salida esperada:
% Lista de enteros en el rango: [3, 4, 5, 6, 7]
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Crea una lista con todos los enteros dentro de un rango dado.
% Caso base: cuando el inicio y el final son iguales.
range(I, I, [I]).
% Caso recursivo: agrega el inicio a la lista y continúa con el siguiente número.
range(I, K, [I|R]) :- I < K, I1 is I + 1, range(I1, K, R).

% Ejemplo de uso:
% ?- range(3, 7, R).
% R = [3, 4, 5, 6, 7].
% ----------------------------------------------


% Predicado principal (main)
main :-
    % Definimos el rango
    Inicio = 3,
    Fin = 7,
    
    % Creamos la lista de enteros en el rango
    range(Inicio, Fin, Resultado),
    
    % Mostramos el resultado
    write('Lista de enteros en el rango ('), write(Inicio), write(', '), write(Fin), write('): '), write(Resultado), nl.

% Ejemplo de uso:
% ?- main.
% Lista de enteros en el rango (3, 7): [3, 4, 5, 6, 7].
