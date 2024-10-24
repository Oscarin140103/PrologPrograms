% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que extrae un
%              número dado de elementos aleatorios de una lista.
%              Utiliza un generador de números aleatorios y
%              elimina los elementos seleccionados.
%              Se incluye una versión comentada
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Función para extraer un número dado de elementos aleatorios de una lista en Python.
% import random
%
% def rnd_select(lst, n):
%     return random.sample(lst, n)  # Selecciona n elementos únicos aleatorios
%
% Ejemplo de uso:
% lista = ['a', 'b', 'c', 'd', 'e']
% selected_elements = rnd_select(lista, 3)
% print("Elementos seleccionados aleatoriamente:", selected_elements)
%
% Salida esperada:
% Elementos seleccionados aleatoriamente: ['b', 'e', 'c']  # (Ejemplo; puede variar)
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Extrae un número dado de elementos aleatorios de una lista.
% Utiliza un generador de números aleatorios y elimina los elementos seleccionados.
rnd_select(_, 0, []).
rnd_select(L, N, [X|R]) :-
    length(L, Len),
    random(1, Len, I),
    element_at(X, L, I),
    delete(L, X, L1),
    N1 is N - 1,
    rnd_select(L1, N1, R).

% Obtiene el elemento en la posición I de la lista L.
element_at(X, [X|_], 1).  % Caso base: el primer elemento
element_at(X, [_|T], I) :-  % Caso recursivo: se reduce la lista y el índice
    I > 1,                  % Asegúrate de que I sea mayor que 1
    I1 is I - 1,            % Disminuir el índice
    element_at(X, T, I1).   % Llamada recursiva sobre la cola de la lista

% Ejemplo de uso:
% ?- rnd_select([a,b,c,d,e], 3, R).
% R = [c, a, e].  % (Ejemplo; puede variar)
% ----------------------------------------------

% Predicado principal (main)
main :-
    % Definimos la lista y el número de elementos a seleccionar
    Lista = [a, b, c, d, e],
    NumElementos = 3,

    % Extraemos elementos aleatorios
    rnd_select(Lista, NumElementos, Resultado),

    % Mostramos el resultado
    write('Elementos seleccionados aleatoriamente: '), write(Resultado), nl.

% Ejemplo de uso:
% ?- main.
% Elementos seleccionados aleatoriamente: [c, a, e].  % (Ejemplo; puede variar)
