% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que calcula la 
%              función totiente de Euler de 
%              manera eficiente usando factores 
%              primos y su multiplicidad.
% ===============================================

% -------- Código en Prolog --------------------
% Encuentra los factores primos de N junto con su multiplicidad.
prime_factors(N, L) :- 
    N > 1, 
    prime_factors(N, 2, L).

prime_factors(1, _, []).
prime_factors(N, F, [F|L]) :- 
    N > 1, 
    0 is N mod F, 
    N1 is N // F, 
    prime_factors(N1, F, L).
prime_factors(N, F, L) :- 
    N > 1, 
    F * F < N, 
    next_factor(F, F1), 
    prime_factors(N, F1, L).

next_factor(2, 3).
next_factor(F, F1) :- 
    F > 2, 
    F1 is F + 2.

% Codifica una lista usando codificación Run-Length para obtener la multiplicidad.
encode(L, R) :- pack(L, P), transform(P, R).

pack([], []).
pack([X|Xs], [[X|Ys]|Zs]) :- transfer(X, Xs, Ys, Rest), pack(Rest, Zs).

transfer(X, [Y|Ys], [], [Y|Ys]) :- X \= Y.
transfer(X, [X|Xs], [X|Ys], Rest) :- transfer(X, Xs, Ys, Rest).
transfer(_, [], [], []).

transform([], []).
transform([[X|Xs]|Ys], [[N,X]|Zs]) :- length([X|Xs], N), transform(Ys, Zs).

% Encuentra los factores primos de N junto con su multiplicidad.
prime_factors_mult(N, L) :- 
    prime_factors(N, F), 
    encode(F, L).

% Calcula la función totiente mejorada.
totient_improved(N, Phi) :- 
    prime_factors_mult(N, F), 
    totient_phi(F, Phi).

% Calcula la función totiente a partir de los factores primos con su multiplicidad.
totient_phi([], 1).
totient_phi([[P, M]|T], Phi) :- 
    totient_phi(T, Phi1), 
    Phi is Phi1 * (P - 1) * P ** (M - 1).

% main: Ejemplo de uso interactivo.
main :- 
    write('Introduce un número: '),
    read(N),
    totient_improved(N, Phi),
    write('La función totiente mejorada de '), write(N), write(' es '), write(Phi), nl.

% Inicialización del programa principal.
:- initialization(main).
% ----------------------------------------------
