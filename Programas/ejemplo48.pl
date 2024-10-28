% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que construye un árbol
%              binario de búsqueda a partir de una lista
%              de enteros. Se incluye una versión
%              comentada en Python para referencia.
%              Un árbol binario de búsqueda es un árbol
%              en el cual, para cada nodo, todos los
%              elementos en el subárbol izquierdo son
%              menores y en el subárbol derecho son mayores.
% ===============================================

% -------- Código en Python (comentado) ---------
% Construye un árbol binario de búsqueda a partir de una lista de enteros.
%
% class TreeNode:
%     def __init__(self, value, left=None, right=None):
%         self.value = value
%         self.left = left
%         self.right = right
%
% def construct(lst):
%     tree = None
%     for value in lst:
%         tree = add(value, tree)
%     return tree
%
% def add(value, node):
%     if node is None:
%         return TreeNode(value)
%     if value < node.value:
%         node.left = add(value, node.left)
%     else:
%         node.right = add(value, node.right)
%     return node
%
% Ejemplo de uso:
% lst = [7, 3, 9, 1, 5, 8, 10]  % Cambia la lista según sea necesario.
% tree = construct(lst)
% print('Árbol binario de búsqueda:', tree)
%
% Salida esperada:
% Árbol binario de búsqueda: <representación del árbol>
% ----------------------------------------------

% -------- Código en Prolog --------------------
% binary_search_tree.pl
% Construye un árbol binario de búsqueda a partir de una lista de enteros.
% Un árbol binario de búsqueda es un árbol en el cual, para cada nodo,
% todos los elementos en el subárbol izquierdo son menores y en el subárbol derecho son mayores.

construct([], nil).
construct([X|Xs], T) :- 
    construct(Xs, T1), 
    add(X, T1, T).

% Añade un nodo a un árbol binario de búsqueda.
add(X, nil, t(X, nil, nil)).
add(X, t(Root, L, R), t(Root, NL, R)) :- 
    X < Root, 
    add(X, L, NL).
add(X, t(Root, L, R), t(Root, L, NR)) :- 
    X >= Root, 
    add(X, R, NR).

main :- 
    List = [7, 3, 9, 1, 5, 8, 10],  % Cambia la lista según sea necesario.
    construct(List, Tree),
    write('Árbol binario de búsqueda:'), nl,
    write(Tree), nl.

:- initialization(main).
