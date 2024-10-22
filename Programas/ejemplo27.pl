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
% Agrupa los elementos de un conjunto en subconjuntos disjuntos dados los tamaños de los subgrupos.
group([], [], []).
group([N|Ns], Es, [G|Gs]) :- 
    combination(N, Es, G), 
    subtract(Es, G, Rest), 
    group(Ns, Rest, Gs).

% Ejemplo de uso:
% ?- group([2, 3, 2], [a, b, c, d, e, f, g], Grupos).
% Grupos = [[a, b], [c, d, e], [f, g]].
% ----------------------------------------------
