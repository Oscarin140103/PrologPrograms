% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Encuentra las composiciones de Goldbach para 
%              todos los números pares dentro de un rango.
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

% Encuentra dos números primos que sumen un número par dado según la conjetura de Goldbach.
goldbach(N, [P1, P2]) :- 
    N > 2, 
    N mod 2 =:= 0,      % Asegura que N sea un número par mayor que 2.
    prime_list(2, N, Primes),  % Genera la lista de números primos hasta N.
    member(P1, Primes),  % Elige un primo P1 de la lista.
    P2 is N - P1,        % Calcula P2 como la diferencia entre N y P1.
    is_prime(P2).        % Verifica que P2 también sea primo.

% Encuentra las composiciones de Goldbach para todos los números pares dentro de un rango.
goldbach_list(Low, High, L) :- 
    findall([N, P1, P2], (between(Low, High, N), N mod 2 =:= 0, goldbach(N, [P1, P2])), L).  % Encuentra las composiciones.

% main: Ejemplo de uso interactivo.
main :- 
    write('Introduce el límite inferior del rango: '),
    read(Low),    % Lee el límite inferior introducido por el usuario.
    write('Introduce el límite superior del rango: '),
    read(High),   % Lee el límite superior introducido por el usuario.
    goldbach_list(Low, High, L),  % Llama al predicado goldbach_list.
    write('Las composiciones de Goldbach son: '), nl,
    forall(member([N, P1, P2], L), format('~d = ~d + ~d~n', [N, P1, P2])).  % Muestra los resultados.

% Inicialización del programa principal.
:- initialization(main).
% ----------------------------------------------
