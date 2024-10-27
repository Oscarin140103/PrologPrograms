% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Encuentra dos números primos que sumen 
%              un número par dado según la conjetura de Goldbach.
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

% main: Ejemplo de uso interactivo.
main :- 
    write('Introduce un número par mayor que 2: '),
    read(N),    % Lee el número par introducido por el usuario.
    (   goldbach(N, [P1, P2])  % Llama al predicado goldbach.
    ->  format('Los números primos que suman ~d son: ~d y ~d~n', [N, P1, P2])  % Muestra los resultados.
    ;   write('No se encontraron números primos que sumen al número dado.'), nl).  % Mensaje de error si no se encuentran.

% Inicialización del programa principal.
:- initialization(main).
% ----------------------------------------------
