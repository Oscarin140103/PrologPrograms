% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que calcula el 
%              máximo común divisor (MCD) de dos 
%              números usando el algoritmo de Euclides.
%              Se incluye una versión comentada 
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Función para calcular el MCD de dos números usando el algoritmo de Euclides en Python.
% def gcd(x, y):
%     while y != 0:
%         x, y = y, x % y
%     return x
%
% Ejemplo de uso:
% numero1 = 56
% numero2 = 98
% mcd = gcd(numero1, numero2)
% print(f"El MCD de {numero1} y {numero2} es {mcd}")
%
% Salida esperada:
% El MCD de 56 y 98 es 14
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Calcula el máximo común divisor usando el algoritmo de Euclides.

% Caso base: Si Y es 0, el MCD es X.
gcd(X, 0, X) :- X > 0.

% Calcula el MCD de X y Y usando recursión.
gcd(X, Y, G) :- 
    Y > 0, 
    R is X mod Y, 
    gcd(Y, R, G).

% Ejemplo de uso interactivo con el usuario.
main :- 
    write('Introduce el primer número: '),
    read(X),
    write('Introduce el segundo número: '),
    read(Y),
    gcd(X, Y, G),
    write('El MCD de '), write(X), write(' y '), write(Y), write(' es '), write(G), nl.

% Inicialización del programa principal.
:- initialization(main).
% ----------------------------------------------
