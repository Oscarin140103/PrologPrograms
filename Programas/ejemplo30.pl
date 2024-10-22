% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que verifica si un
%              número entero dado es primo.
%              Se incluye una versión comentada 
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Función para verificar si un número entero es primo en Python.
% def is_prime(n):
%     if n <= 1:
%         return False
%     if n == 2 or n == 3:
%         return True
%     if n % 2 == 0:
%         return False
%     for i in range(3, int(n ** 0.5) + 1, 2):
%         if n % i == 0:
%             return False
%     return True
%
% Ejemplo de uso:
% numero = 29
% es_primo = is_prime(numero)
% print(f"¿Es {numero} primo? {es_primo}")
%
% Salida esperada:
% ¿Es 29 primo? True
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Verifica si un número entero dado es primo.

is_prime(2).  % 2 es primo
is_prime(3).  % 3 es primo
is_prime(P) :- 
    P > 3,                   % P debe ser mayor que 3
    P mod 2 =\= 0,           % P no debe ser divisible por 2
    \\+ has_factor(P, 3).     % P no debe tener factores

% Verifica si un número tiene factores.
has_factor(N, L) :- 
    N mod L =:= 0.            % Si N es divisible por L, entonces tiene un factor
has_factor(N, L) :- 
    L * L < N,                % Si L² es menor que N, sigue buscando factores
    L2 is L + 2,              % Incrementa el divisor en 2
    has_factor(N, L2).        % Llama recursivamente con el siguiente divisor

% Ejemplo de uso:
% ?- is_prime(29).
% true.
% ----------------------------------------------
