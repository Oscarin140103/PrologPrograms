% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              los factores primos de un número 
%              junto con su multiplicidad. Se 
%              utiliza codificación Run-Length.
% ===============================================

% -------- Código en Prolog --------------------
% Encuentra los factores primos de N.
prime_factors(N, L) :- 
    N > 1, 
    prime_factors(N, 2, L).

% Caso base: si N es 1, no quedan factores primos.
prime_factors(1, _, []).

% Si F divide a N, F es un factor primo.
prime_factors(N, F, [F|L]) :- 
    N > 1, 
    0 is N mod F, 
    N1 is N // F, 
    prime_factors(N1, F, L).

% Si F no divide a N, encuentra el siguiente factor.
prime_factors(N, F, L) :- 
    N > 1, 
    F * F < N, 
    next_factor(F, F1), 
    prime_factors(N, F1, L).

% Encuentra el siguiente factor primo.
next_factor(2, 3).
next_factor(F, F1) :- 
    F > 2, 
    F1 is F + 2.

% Codifica una lista usando codificación Run-Length.
% Primero agrupa los duplicados y luego transforma las sublistas en parejas (N, X).
encode(L, R) :- pack(L, P), transform(P, R).

% Agrupa duplicados consecutivos en sublistas.
pack([], []).
pack([X|Xs], [[X|Ys]|Zs]) :- transfer(X, Xs, Ys, Rest), pack(Rest, Zs).

% Transfiere elementos iguales consecutivos a una sublista.
transfer(X, [Y|Ys], [], [Y|Ys]) :- X \= Y.
transfer(X, [X|Xs], [X|Ys], Rest) :- transfer(X, Xs, Ys, Rest).
transfer(_, [], [], []).

% Transforma sublistas en parejas (N, X), donde N es la cantidad de elementos.
transform([], []).
transform([[X|Xs]|Ys], [[N,X]|Zs]) :- length([X|Xs], N), transform(Ys, Zs).

% Encuentra los factores primos de N junto con su multiplicidad.
prime_factors_mult(N, L) :- 
    prime_factors(N, F), 
    encode(F, L).

% main: Ejemplo de uso interactivo.
main :- 
    write('Introduce un número: '),
    read(N),
    prime_factors_mult(N, FactorsMult),
    write('Los factores primos de '), write(N), write(' con su multiplicidad son: '), write(FactorsMult), nl.

% Inicialización del programa principal.
:- initialization(main).
% ----------------------------------------------
