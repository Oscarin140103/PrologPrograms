% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que comprueba si un
%              árbol binario es simétrico. Un árbol es
%              simétrico si sus subárboles izquierdo y
%              derecho son espejos entre sí. Se incluye
%              una versión comentada en Python para
%              referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Comprueba si un árbol binario es simétrico.
%
% class TreeNode:
%     def __init__(self, value, left=None, right=None):
%         self.value = value
%         self.left = left
%         self.right = right
%
% def is_symmetric(node):
%     if node is None:
%         return True
%     return mirror(node.left, node.right)
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
% symmetric_tree = TreeNode(1, TreeNode(2), TreeNode(2))  # Árbol simétrico
% asymmetric_tree = TreeNode(1, TreeNode(2), TreeNode(3))  # Árbol no simétrico
% print(symmetric_tree, 'es un árbol simétrico.' if is_symmetric(symmetric_tree) else 'no es un árbol simétrico.')
% print(asymmetric_tree, 'es un árbol simétrico.' if is_symmetric(asymmetric_tree) else 'no es un árbol simétrico.')
%
% Salida esperada:
% t(1, t(2, nil, nil), t(2, nil, nil)) es un árbol simétrico.
% t(1, t(2, nil, nil), t(3, nil, nil)) no es un árbol simétrico.
% ----------------------------------------------

% -------- Código en Prolog --------------------
% symmetric_tree.pl
% Comprueba si un árbol binario es simétrico.
% Un árbol es simétrico si sus subárboles izquierdo y derecho son espejos entre sí.

symmetric(nil).
symmetric(t(_, L, R)) :- mirror(L, R).

% Verifica si un árbol es el espejo de otro.
mirror(nil, nil).
mirror(t(_, L1, R1), t(_, L2, R2)) :- mirror(L1, R2), mirror(R1, L2).

main :-
    % Ejemplos de árboles para verificar
    SymmetricTree = t(1, t(2, nil, nil), t(2, nil, nil)),  % Árbol simétrico
    AsymmetricTree = t(1, t(2, nil, nil), t(3, nil, nil)), % Árbol no simétrico
    check_tree(SymmetricTree),
    check_tree(AsymmetricTree).

check_tree(Tree) :-
    (   symmetric(Tree)
    ->  write(Tree), write(' es un árbol simétrico.'), nl
    ;   write(Tree), write(' no es un árbol simétrico.'), nl
    ).

:- initialization(main).
