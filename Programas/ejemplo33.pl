% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que calcula la 
%              función totiente de Euler. Esta función
%              cuenta cuántos números menores que M son
%              coprimos con M. Se incluye una versión 
%              comentada en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Función para calcular el MCD de dos números.
% def gcd(x, y):
%     while y != 0:
%         x, y = y, x % y
%     return x
%
% Función para verificar si dos números son coprimos.
% def coprime(x, y):
%     return gcd(x, y) == 1
%
% Función para calcular la función totiente de Euler.
% def totient(m):
%     count = 0
%     for i in range(1, m+1):
%         if coprime(m, i):
%             count += 1
%     return count
%
% Ejemplo de uso:
% numero = 10
% resultado = totient(numero)
% print(f'La función totiente de Euler para {numero} es {resultado}')
%
% Salida esperada:
% La función totiente de Euler para 10 es 4
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

% Calcula la función totiente de Euler para M.
totient(1, 1).
totient(M, Phi) :- 
    M > 1, 
    totient_acc(M, M, 0, Phi).

% Acumulador de la función totiente.
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

% main: Ejemplo de uso interactivo.
main :- 
    write('Introduce un número: '),
    read(M),
    totient(M, Phi),
    write('La función totiente de Euler para '), write(M), write(' es '), write(Phi), nl.

% Inicialización del programa principal.
:- initialization(main).
% ----------------------------------------------
