% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que construye
%              un árbol binario equilibrado en altura
%              con una altura dada. Un árbol equilibrado
%              en altura tiene subárboles cuya diferencia
%              de altura es como máximo 1.
% ===============================================

% -------- Código en Python (comentado) ---------
% Construye un árbol binario equilibrado en altura con una altura dada.
%
% class TreeNode:
%     def __init__(self, value, left=None, right=None):
%         self.value = value
%         self.left = left
%         self.right = right
%
% def hbal_tree(height):
%     if height == 0:
%         return None
%     left = hbal_tree(height - 1)
%     right = hbal_tree(height - 2)
%     return TreeNode('x', left, right)
%
% Ejemplo de uso:
% height = 3  # Cambia la altura según sea necesario.
% tree = hbal_tree(height)
% print('Árbol binario equilibrado en altura con altura', height, ':', tree)
%
% Salida esperada:
% Árbol binario equilibrado en altura con altura 3: <representación del árbol>
% ----------------------------------------------

% -------- Código en Prolog --------------------
hbal_tree(0, nil).  % Un árbol de altura 0 es nil (vacío).
hbal_tree(H, t('x', L, R)) :-  % Crear un nodo con valor 'x'.
    H > 0,
    H1 is H - 1,
    H2 is H - 1,  % Los subárboles izquierdo y derecho tienen altura H - 1.
    hbal_tree(H1, L),  % Generar subárbol izquierdo.
    hbal_tree(H2, R).  % Generar subárbol derecho.

main :- 
    Height = 3,  % Cambia la altura según sea necesario.
    hbal_tree(Height, Tree),
    write('Árbol binario equilibrado en altura con altura '),
    write(Height), 
    write(':'), nl,
    write(Tree), nl.

:- initialization(main).
