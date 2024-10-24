% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que verifica si 
%              dos números son coprimos. Dos números 
%              son coprimos si su máximo común divisor 
%              es 1. Se incluye una versión comentada 
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Función para calcular el MCD de dos números y verificar si son coprimos.
% def gcd(x, y):
%     while y != 0:
%         x, y = y, x % y
%     return x
%
% def coprime(x, y):
%     return gcd(x, y) == 1
%
% Ejemplo de uso:
% numero1 = 35
% numero2 = 64
% if coprime(numero1, numero2):
%     print(f"{numero1} y {numero2} son coprimos.")
% else:
%     print(f"{numero1} y {numero2} no son coprimos.")
%
% Salida esperada:
% 35 y 64 son coprimos.
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Calcula el máximo común divisor usando el algoritmo de Euclides.
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- 
    Y > 0, 
    R is X mod Y, 
    gcd(Y, R, G).

% Verifica si dos números son coprimos.
coprime(X, Y) :- 
    gcd(X, Y, 1).

% Ejemplo de uso interactivo con el usuario.
main :- 
    write('Introduce el primer número: '),
    read(X),
    write('Introduce el segundo número: '),
    read(Y),
    ( coprime(X, Y) -> 
        write(X), write(' y '), write(Y), write(' son coprimos.'), nl
    ; 
        write(X), write(' y '), write(Y), write(' no son coprimos.'), nl
    ).

% Inicialización del programa principal.
:- initialization(main).
% ----------------------------------------------
