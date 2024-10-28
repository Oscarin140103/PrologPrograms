% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que construye un
%              árbol binario completamente equilibrado
%              con N nodos. Se incluye una versión
%              comentada en Python para referencia.
%              Un árbol completamente equilibrado tiene
%              subárboles cuya diferencia de tamaño es
%              como máximo 1.
% ===============================================

% -------- Código en Python (comentado) ---------
% Construye un árbol binario completamente equilibrado con N nodos.
%
% class TreeNode:
%     def __init__(self, value, left=None, right=None):
%         self.value = value
%         self.left = left
%         self.right = right
%
% def cbal_tree(n):
%     if n == 0:
%         return None
%     left_size = n // 2
%     right_size = n - left_size - 1
%     return TreeNode('x', cbal_tree(left_size), cbal_tree(right_size))
%
% Ejemplo de uso:
% n = 5  # Cambia el número de nodos según sea necesario.
% tree = cbal_tree(n)
% print('Árbol binario completamente equilibrado con', n, 'nodos:', tree)
%
% Salida esperada:
% Árbol binario completamente equilibrado con 5 nodos: <representación del árbol>
% ----------------------------------------------

% -------- Código en Prolog --------------------
% balanced_tree.pl
% Construye un árbol binario completamente equilibrado con N nodos.
% Un árbol completamente equilibrado tiene subárboles cuya diferencia de tamaño es como máximo 1.

cbal_tree(0, nil).
cbal_tree(N, t('x', L, R)) :- 
    N > 0, 
    N1 is N - 1, 
    divide(N1, N2, N3), 
    cbal_tree(N2, L), 
    cbal_tree(N3, R).

% Divide el número de nodos entre los dos subárboles.
divide(N, N1, N2) :- 
    N1 is N // 2, 
    N2 is N - N1.

main :-
    N = 5,  % Cambia el número de nodos según sea necesario.
    cbal_tree(N, Tree),
    write('Árbol binario completamente equilibrado con '), write(N), write(' nodos:'), nl,
    write(Tree), nl.

:- initialization(main).
