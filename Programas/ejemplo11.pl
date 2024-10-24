% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que modifica la
%              codificación Run-Length de una lista.
%              Se incluye una versión comentada 
%              en Python para referencia.
% ===============================================

% -------- Código en Prolog --------------------
% Modifica la codificación Run-Length de una lista.
% Si un elemento no tiene duplicados, se mantiene sin empaquetar.

% Codifica la lista y luego la modifica.
encode_modified(L, R) :- encode(L, Enc), modify(Enc, R).

% Codifica la lista original usando Run-Length Encoding
encode([], []).
encode([X|Xs], Encoded) :- 
    count_occurrences(X, Xs, 1, Rest, Count),
    encode(Rest, EncodedRest),
    Encoded = [[Count, X] | EncodedRest].

% Cuenta cuántas veces aparece el primer elemento en la lista.
count_occurrences(X, [X|Xs], Count, Rest, FinalCount) :- 
    Count1 is Count + 1,
    count_occurrences(X, Xs, Count1, Rest, FinalCount).
count_occurrences(X, [Y|Ys], Count, [Y|Ys], Count) :- X \= Y.
count_occurrences(X, [], Count, [], Count).

% Caso base: lista vacía.
modify([], []).

% Si hay solo un elemento, agrégalo directamente.
modify([[1,X]|T], [X|R]) :- modify(T, R).

% Si hay más de un elemento, mantén el formato [N, X].
modify([[N,X]|T], [[N,X]|R]) :- N > 1, modify(T, R).

% Predicado principal (main)
main :-
    % Definimos una lista de ejemplo
    Lista = [a, a, b, c, c, c],
    
    % Aplicamos la codificación modificada
    encode_modified(Lista, Resultado),
    
    % Mostramos el resultado
    write('Lista codificada modificada: '), write(Resultado), nl.

% Ejemplo de uso:
% ?- main.
% Lista codificada modificada: [[2, a], b, [3, c]].
