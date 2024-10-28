% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que genera todos
%              los árboles binarios simétricos y
%              completamente equilibrados con N nodos.
%              Se utiliza el paradigma de generar y
%              probar para encontrar todos los árboles
%              que cumplen ambas propiedades.
% ===============================================

% -------- Código en Python (comentado) ---------
% Genera todos los árboles binarios simétricos y completamente equilibrados con N nodos.
%
% class TreeNode:
%     def __init__(self, value, left=None, right=None):
%         self.value = value
%         self.left = left
%         self.right = right
%
% def cbal_tree(n):
%     if n == 0:
%         return [None]
%     trees = []
%     for i in range(n):
%         left_trees = cbal_tree(i)
%         right_trees = cbal_tree(n - 1 - i)
%         for left in left_trees:
%             for right in right_trees:
%                 trees.append(TreeNode('x', left, right))
%     return trees
%
% def is_symmetric(tree):
%     if tree is None:
%         return True
%     return mirror(tree.left, tree.right)
%
% def mirror(left, right):
%     if left is None and right is None:
%         return True
%     if left is None or right is None:
%         return False
%     return (left.value == right.value and
%             mirror(left.left, right.right) and
%             mirror(left.right, right.left))
%
% Ejemplo de uso:
% N = 4  # Cambia el número de nodos según sea necesario.
% trees = [tree for tree in cbal_tree(N) if is_symmetric(tree)]
% print('Árboles binarios simétricos y completamente equilibrados con', N, 'nodos:', trees)
%
% Salida esperada:
% Árboles binarios simétricos y completamente equilibrados con 4 nodos: <representación de los árboles>
% ----------------------------------------------

% -------- Código en Prolog --------------------
cbal_tree(0, nil).
cbal_tree(N, t('x', L, R)) :-
    N > 0,
    N1 is N - 1,
    % Dividir N1 en dos partes iguales (o casi iguales si es impar)
    N2 is N1 // 2,
    N3 is N1 - N2,
    cbal_tree(N2, L),
    cbal_tree(N3, R),
    % Asegurarse de que el árbol sea simétrico
    mirror(L, R).

% Verifica si un árbol es el espejo de otro.
mirror(nil, nil).
mirror(t(_, L1, R1), t(_, L2, R2)) :- mirror(L1, R2), mirror(R1, L2).

sym_cbal_trees(N, Ts) :-
    findall(T, cbal_tree(N, T), Ts).

main :-
    N = 4,  % Cambia el número de nodos según sea necesario.
    sym_cbal_trees(N, Trees),
    write('Árboles binarios simétricos y completamente equilibrados con '),
    write(N),
    write(' nodos:'), nl,
    write(Trees), nl.

:- initialization(main).
