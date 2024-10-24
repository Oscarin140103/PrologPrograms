% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que codifica
%              una lista usando codificación Run-Length.
% ===============================================

% run_length_encode.pl
% Codifica una lista usando codificación Run-Length.
% Primero agrupa los duplicados y luego transforma las sublistas en parejas (N, X).

% Agrupa elementos consecutivos duplicados en sublistas.
pack([], []).
pack([X|Xs], [[X|Ys]|Zs]) :- 
    collect(X, Xs, Ys, Rest),
    pack(Rest, Zs).

% Reúne elementos duplicados.
collect(X, [], [], []).
collect(X, [X|Xs], [X|Ys], Rest) :- 
    collect(X, Xs, Ys, Rest).
collect(X, [Y|Ys], [], [Y|Ys]) :- 
    X \= Y.

% Codifica la lista.
encode(L, R) :- 
    pack(L, P), 
    transform(P, R).

% Transforma sublistas en parejas (N, X), donde N es la cantidad de elementos.
transform([], []).
transform([[X|Xs]|Ys], [[N, X]|Zs]) :- 
    length([X|Xs], N), 
    transform(Ys, Zs).

% main: Ejemplo de uso
main :-
    List = [a, a, b, c, c, c, d, d, e, e, e, e],
    encode(List, Encoded),
    write('Lista codificada: '), write(Encoded), nl.

:- initialization(main).
