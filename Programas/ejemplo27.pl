% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que agrupa los elementos
%              de un conjunto en subconjuntos disjuntos
%              dados los tamaños de los subgrupos.
%              Se incluye una versión comentada 
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Función para agrupar los elementos de una lista en subgrupos disjuntos en Python.
% from itertools import combinations
%
% def group(sizes, elements):
%     result = []
%     remaining_elements = elements.copy()
%     
%     for size in sizes:
%         comb = list(combinations(remaining_elements, size))[0]  # Escoge la primera combinación
%         result.append(comb)
%         for item in comb:
%             remaining_elements.remove(item)  # Elimina los elementos seleccionados
%         
%     return result
%
% Ejemplo de uso:
% elementos = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
% subgrupos = group([2, 3, 2], elementos)
% print("Subgrupos:", subgrupos)
%
% Salida esperada:
% Subgrupos: [('a', 'b'), ('c', 'd', 'e'), ('f', 'g')]
% ----------------------------------------------

% -------- Código en Prolog --------------------
% group.pl
% Agrupa los elementos de un conjunto en subconjuntos disjuntos dados los tamaños de los subgrupos.

% Combina N elementos de una lista.
combination(0, _, []).
combination(N, L, [X|Xs]) :-
    select(X, L, Rest),
    N1 is N - 1,
    combination(N1, Rest, Xs).

% Agrupa los elementos en subconjuntos disjuntos.
group([], _, []).
group([N|Ns], Es, [G|Gs]) :-
    combination(N, Es, G),
    subtract(Es, G, Rest),
    group(Ns, Rest, Gs).

% main: Ejemplo de uso
main :-
    Sizes = [2, 3],  % Tamaños de los grupos
    Elements = [a, b, c, d, e, f],  % Elementos a agrupar
    group(Sizes, Elements, Groups),
    write('Grupos: '), write(Groups), nl.

:- initialization(main).
