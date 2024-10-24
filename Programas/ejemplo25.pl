% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que genera una
%              permutación aleatoria de los elementos
%              de una lista. Utiliza la selección aleatoria
%              para construir la permutación.
%              Se incluye una versión comentada
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Función para generar una permutación aleatoria de los elementos de una lista en Python.
% import random
%
% def rnd_permu(lst):
%     random.shuffle(lst)  # Mezcla los elementos de la lista en su lugar
%     return lst
%
% Ejemplo de uso:
% lista = ['a', 'b', 'c', 'd', 'e']
% permuted_lista = rnd_permu(lista.copy())  # Copia para no modificar la original
% print("Permutación aleatoria:", permuted_lista)
%
% Salida esperada:
% Permutación aleatoria: ['c', 'a', 'e', 'b', 'd']  # (Ejemplo; puede variar)
% ----------------------------------------------

% -------- Código en Prolog --------------------
% rnd_permu.pl
% Genera una permutación aleatoria de los elementos de una lista.
% Utiliza la selección aleatoria para construir la permutación.

% Selecciona un elemento aleatorio de la lista y lo elimina.
rnd_select([], 0, []).
rnd_select(L, N, [X|R]) :-
    length(L, Len),
    random_between(1, Len, I),
    nth1(I, L, X),
    select(X, L, L1),
    N1 is N - 1,
    rnd_select(L1, N1, R).

% Genera una permutación aleatoria de los elementos de una lista.
rnd_permu(L, P) :- length(L, Len), rnd_select(L, Len, P).

% main: Ejemplo de uso
main :-
    List = [a, b, c, d, e],
    rnd_permu(List, Perm),
    write('Permutación aleatoria: '), write(Perm), nl.

:- initialization(main).
