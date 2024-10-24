% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que extrae N números
%              aleatorios de un rango dado. Utiliza la
%              función range para generar la lista de
%              números y luego selecciona aleatoriamente.
%              Se incluye una versión comentada
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Función para extraer N números aleatorios de un rango dado en Python.
% import random
%
% def lotto(n, m):
%     return random.sample(range(1, m + 1), n)  # Selecciona n números únicos del rango
%
% Ejemplo de uso:
% selected_numbers = lotto(6, 49)
% print("Números seleccionados aleatoriamente:", selected_numbers)
%
% Salida esperada:
% Números seleccionados aleatoriamente: [3, 15, 22, 37, 41, 8]  # (Ejemplo; puede variar)
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Genera una lista de números desde Start hasta End
range(Start, End, [Start|Rest]) :- 
    Start < End, 
    Next is Start + 1, 
    range(Next, End, Rest).
range(End, End, [End]).  % Caso base: cuando Start es igual a End

% Extrae N números aleatorios de un rango dado.
% Utiliza la función range para generar la lista de números y luego selecciona aleatoriamente.
rnd_select(_, 0, []).  % Caso base: si N es 0, la lista resultante es vacía.
rnd_select(L, N, [X|R]) :- 
    length(L, Len), 
    random(1, Len, I), 
    element_at(X, L, I), 
    delete(L, X, L1), 
    N1 is N - 1, 
    rnd_select(L1, N1, R).

% Obtiene el elemento en la posición I de la lista L.
element_at(X, [X|_], 1).  % Caso base: el primer elemento.
element_at(X, [_|T], I) :-  % Caso recursivo: se reduce la lista y el índice.
    I > 1,                  % Asegúrate de que I sea mayor que 1.
    I1 is I - 1,            % Disminuir el índice.
    element_at(X, T, I1).   % Llamada recursiva sobre la cola de la lista.

% Extrae N números aleatorios de un rango dado.
lotto(N, M, L) :- 
    range(1, M, R), 
    rnd_select(R, N, L).

% Ejemplo de uso:
% ?- lotto(6, 49, L).
% L = [3, 15, 22, 37, 41, 8].  % (Ejemplo; puede variar)
% ----------------------------------------------

% Predicado principal (main)
main :- 
    % Definimos la cantidad de números a seleccionar y el rango máximo.
    N = 6,  % Cantidad de números aleatorios.
    M = 49,  % Rango máximo (1 a M).

    % Extraemos los números aleatorios.
    lotto(N, M, Resultado),

    % Mostramos el resultado.
    write('Números seleccionados aleatoriamente: '), write(Resultado), nl.

% Ejemplo de uso:
% ?- main.
% Números seleccionados aleatoriamente: [3, 15, 22, 37, 41, 8].  % (Ejemplo; puede variar).
