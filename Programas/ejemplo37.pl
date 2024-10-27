% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Comparación de dos métodos para
%              calcular la función totiente de Euler.
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

% Codifica una lista usando codificación Run-Length.
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

% Método básico para calcular la función totiente.
totient(1, 1).
totient(M, Phi) :- 
    M > 1, 
    totient_acc(M, M, 0, Phi).

totient_acc(_, 0, Acc, Acc).
totient_acc(M, K, Acc, Phi) :- 
    K > 0, 
    coprime(M, K), 
    Acc1 is Acc + 1, 
    K1 is K - 1, 
    totient_acc(M, K1, Acc1, Phi).
totient_acc(M, K, Acc, Phi) :- 
    K > 0, 
    \+ coprime(M, K), 
    K1 is K - 1, 
    totient_acc(M, K1, Acc, Phi).

% Dos números son coprimos si su máximo común divisor es 1.
coprime(X, Y) :- gcd(X, Y, 1).

% Calcula el máximo común divisor usando el algoritmo de Euclides.
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- 
    Y > 0, 
    R is X mod Y, 
    gcd(Y, R, G).

% Método mejorado para calcular la función totiente.
totient_improved(N, Phi) :- 
    prime_factors_mult(N, F), 
    totient_phi(F, Phi).

totient_phi([], 1).
totient_phi([[P, M]|T], Phi) :- 
    totient_phi(T, Phi1), 
    Phi is Phi1 * (P - 1) * P ** (M - 1).

% Compara los dos métodos para calcular la función totiente.
compare_totient(N) :-
    totient(N, Phi1),
    totient_improved(N, Phi2),
    write('Phi (método básico): '), write(Phi1), nl,
    write('Phi (método mejorado): '), write(Phi2), nl.

% main: Ejemplo de uso interactivo
main :- 
    write('Introduce un número: '),
    read(N),
    compare_totient(N).

% Inicialización del programa principal.
:- initialization(main).
% ----------------------------------------------
