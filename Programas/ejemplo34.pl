% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que encuentra los
%              factores primos de un número entero 
%              positivo. Se incluye una versión 
%              comentada en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Función para encontrar los factores primos de un número.
% def prime_factors(n):
%     i = 2
%     factors = []
%     while i * i <= n:
%         if n % i:
%             i += 1
%         else:
%             n //= i
%             factors.append(i)
%     if n > 1:
%         factors.append(n)
%     return factors
%
% Ejemplo de uso:
% numero = 28
% factores = prime_factors(numero)
% print(f'Los factores primos de {numero} son: {factores}')
%
% Salida esperada:
% Los factores primos de 28 son: [2, 2, 7]
% ----------------------------------------------

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

% main: Ejemplo de uso interactivo.
main :- 
    write('Introduce un número: '),
    read(N),
    prime_factors(N, Factors),
    write('Los factores primos de '), write(N), write(' son: '), write(Factors), nl.

% Inicialización del programa principal.
:- initialization(main).
% ----------------------------------------------
