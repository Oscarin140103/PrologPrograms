% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que verifica si un
%              término dado representa un árbol binario.
%              Se incluye una versión comentada en Python
%              para referencia. Un árbol binario está
%              compuesto por un nodo raíz y dos subárboles.
% ===============================================

% -------- Código en Python (comentado) ---------
% Verifica si un término dado representa un árbol binario.
%
% class TreeNode:
%     def __init__(self, value, left=None, right=None):
%         self.value = value
%         self.left = left
%         self.right = right
%
% def is_tree(node):
%     if node is None:
%         return True
%     if isinstance(node, TreeNode):
%         return is_tree(node.left) and is_tree(node.right)
%     return False
%
% Ejemplo de uso:
% tree1 = TreeNode(1, TreeNode(2), TreeNode(3))  # Árbol válido
% tree2 = TreeNode(1, TreeNode(2), None)          # Árbol válido
% tree3 = TreeNode(1, TreeNode(2), TreeNode(3, TreeNode(4), None))  # Árbol inválido
% print(tree1, 'es un árbol binario.' if is_tree(tree1) else 'no es un árbol binario.')
% print(tree2, 'es un árbol binario.' if is_tree(tree2) else 'no es un árbol binario.')
% print(tree3, 'es un árbol binario.' if is_tree(tree3) else 'no es un árbol binario.')
%
% Salida esperada:
% t(1, t(2, nil, nil), t(3, nil, nil)) es un árbol binario.
% t(1, t(2, nil, nil), nil) es un árbol binario.
% t(1, t(2, nil, t(3, nil, nil), nil)) no es un árbol binario.
% ----------------------------------------------

% -------- Código en Prolog --------------------
% binary_tree_check.pl
% Verifica si un término dado representa un árbol binario.
% Un árbol binario está compuesto por un nodo raíz y dos subárboles.

istree(nil).
istree(t(_, L, R)) :- istree(L), istree(R).

main :-
    % Ejemplo de árboles para verificar
    Tree1 = t(1, t(2, nil, nil), t(3, nil, nil)),  % Árbol válido
    Tree2 = t(1, t(2, nil, nil), nil),              % Árbol válido
    Tree3 = t(1, t(2, nil, t(3, nil, nil), nil)),  % Árbol inválido
    check_tree(Tree1),
    check_tree(Tree2),
    check_tree(Tree3).

check_tree(Tree) :-
    (   istree(Tree)
    ->  write(Tree), write(' es un árbol binario.'), nl
    ;   write(Tree), write(' no es un árbol binario.'), nl
    ).

:- initialization(main).
