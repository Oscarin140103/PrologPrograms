% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que genera un árbol
%              de Huffman dado un conjunto de frecuencias.
%              Se incluye una versión comentada en Python
%              para referencia. El algoritmo de Huffman se
%              utiliza para la compresión de datos,
%              construyendo un árbol binario óptimo para
%              la codificación.
% ===============================================

% -------- Código en Python (comentado) ---------
% Genera un árbol de Huffman dado un conjunto de frecuencias.
%
% from heapq import heappop, heappush
% from collections import defaultdict
%
% def huffman_tree(frequencies):
%     heap = [[weight, [symbol, '']] for symbol, weight in frequencies]
%     heapify(heap)  # Organiza la lista como un heap
%     while len(heap) > 1:
%         lo = heappop(heap)
%         hi = heappop(heap)
%         for pair in lo[1:]:
%             pair[1] = '0' + pair[1]
%         for pair in hi[1:]:
%             pair[1] = '1' + pair[1]
%         heappush(heap, [lo[0] + hi[0]] + lo[1:] + hi[1:])
%     return sorted(heappop(heap)[1:], key=lambda p: (len(p[-1]), p))
%
% Ejemplo de uso:
% frequencies = [('a', 5), ('b', 9), ('c', 12), ('d', 13), ('e', 16), ('f', 45)]
% tree = huffman_tree(frequencies)
% print('Árbol de Huffman:', tree)
%
% Salida esperada:
% Árbol de Huffman: [['a', '000'], ['b', '001'], ['c', '010'], ['d', '011'], ['e', '10'], ['f', '11']]
% ----------------------------------------------

% -------- Código en Prolog --------------------
% huffman_tree.pl
% Genera un árbol de Huffman dado un conjunto de frecuencias.
% https://es.wikipedia.org/wiki/Codificación_Huffman

% Función principal para construir el árbol de Huffman.
huffman(Fs, H) :- 
    length(Fs, Len), 
    Len > 1, 
    sort(2, @=<, Fs, Sorted), 
    huffman_tree(Sorted, H).

% Caso base para construir el árbol de Huffman.
huffman_tree([fr(X, _)], hc(X, '0')).  % Un solo nodo.
huffman_tree(Fs, H) :- 
    Fs = [fr(X1, F1), fr(X2, F2) | Rest],  % Toma los dos nodos de menor frecuencia.
    F3 is F1 + F2,  % Suma las frecuencias.
    NewNode = fr(hc(X1, X2), F3),  % Crea un nuevo nodo.
    append(Rest, [NewNode], NewFs),  % Agrega el nuevo nodo a la lista.
    sort(2, @=<, NewFs, SortedFs),  % Vuelve a ordenar.
    huffman_tree(SortedFs, H).  % Llama recursivamente.

main :- 
    Frequencies = [fr(a, 5), fr(b, 9), fr(c, 12), fr(d, 13), fr(e, 16), fr(f, 45)],  % Cambia las frecuencias según sea necesario.
    huffman(Frequencies, Tree),
    write('Árbol de Huffman:'), nl,
    write(Tree), nl.

:- initialization(main).
