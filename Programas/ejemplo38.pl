% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Genera una lista de números primos
%              en un rango dado.
% ===============================================

% -------- Código en Prolog --------------------
% Verifica si un número es primo.
is_prime(2).
is_prime(3).
is_prime(P) :- 
    P > 3, 
    P mod 2 =\= 0,     % El número P no debe ser divisible por 2.
    \+ has_factor(P, 3).  % Verifica que P no tenga ningún factor desde 3 en adelante.

% Verifica si un número tiene factores.
has_factor(N, L) :- N mod L =:= 0.   % Si N es divisible por L, entonces L es un factor de N.
has_factor(N, L) :- 
    L * L < N,          % L^2 debe ser menor que N.
    L2 is L + 2,        % Avanza al siguiente número impar.
    has_factor(N, L2).  % Repite la verificación de factores para L2.

% Genera una lista de números primos en un rango dado (Low a High).
prime_list(Low, High, Primes) :- 
    findall(P, (between(Low, High, P), is_prime(P)), Primes).  % Encuentra todos los números P en el rango que son primos.

% main: Ejemplo de uso interactivo.
main :- 
    write('Introduce el límite inferior del rango: '),
    read(Low),    % Lee el valor inferior del rango.
    write('Introduce el límite superior del rango: '),
    read(High),   % Lee el valor superior del rango.
    prime_list(Low, High, Primes),   % Genera la lista de primos en el rango.
    write('Los números primos en el rango son: '), write(Primes), nl.  % Muestra la lista de primos.

% Inicialización del programa principal.
:- initialization(main).
% ----------------------------------------------
