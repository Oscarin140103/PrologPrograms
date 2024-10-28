% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que genera tablas
%              de verdad para operadores lógicos básicos
%              (AND, OR, NAND, NOR, XOR, IMPLICACIÓN,
%              EQUIVALENCIA). Se incluye una versión
%              comentada en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Definición de operadores lógicos básicos y generación de tablas de verdad.
% Funciones para operadores AND, OR, NAND, NOR, XOR, IMPLICACIÓN, EQUIVALENCIA.

% def logical_and(a, b):
%     return a and b
%
% def logical_or(a, b):
%     return a or b
%
% def logical_nand(a, b):
%     return not (a and b)
%
% def logical_nor(a, b):
%     return not (a or b)
%
% def logical_xor(a, b):
%     return (a and not b) or (not a and b)
%
% def logical_impl(a, b):
%     return not a or b
%
% def logical_equ(a, b):
%     return (a and b) or (not a and not b)
%
% Genera una tabla de verdad para una expresión lógica.
% def truth_table(func):
%     values = [False, True]
%     for a in values:
%         for b in values:
%             print(f'{a} {b} {func(a, b)}')
%
% Ejemplos de uso:
% print("Tabla de verdad para AND:")
% truth_table(logical_and)
% print("\nTabla de verdad para OR:")
% truth_table(logical_or)
% Se pueden agregar las demás funciones en el mismo formato.
%
% Salida esperada:
% Tabla de verdad para AND:
% False False False
% False True  False
% True  False False
% True  True  True
% ----------------------------------------------

% -------- Código en Prolog --------------------
% logical_operators_table.pl
% Definición de operadores lógicos básicos y generación de tablas de verdad.

% Definición de los operadores básicos AND, OR, NAND, NOR, XOR, IMPLICACIÓN, EQUIVALENCIA.
and(A, B) :- A, B.
or(A, _) :- A.
or(_, B) :- B.
nand(A, B) :- \+ (A, B).
nor(A, B) :- \+ (A; B).
xor(A, B) :- A, \+ B; \+ A, B.
impl(A, B) :- \+ A; B.
equ(A, B) :- A, B; \+ A, \+ B.

% Genera una tabla de verdad para una expresión lógica en dos variables.
table(A, B, Expr) :-
    (A = true; A = false),  % Asigna valores a A
    (B = true; B = false),  % Asigna valores a B
    write(A), write(' '), write(B), write(' '),
    (call(Expr) -> write(true) ; write(false)),  % Evalúa la expresión
    nl, fail.  % Forzar retroceso para todas las combinaciones
table(_, _, _).

% main: Ejemplo de uso
main :- 
    write('Tabla de verdad para A and B:'), nl,
    table(A, B, and(A, B)),
    nl,
    write('Tabla de verdad para A or B:'), nl,
    table(A, B, or(A, B)),
    nl,
    write('Tabla de verdad para A nand B:'), nl,
    table(A, B, nand(A, B)),
    nl,
    write('Tabla de verdad para A nor B:'), nl,
    table(A, B, nor(A, B)),
    nl,
    write('Tabla de verdad para A xor B:'), nl,
    table(A, B, xor(A, B)),
    nl,
    write('Tabla de verdad para A implica B:'), nl,
    table(A, B, impl(A, B)),
    nl,
    write('Tabla de verdad para A equivale a B:'), nl,
    table(A, B, equ(A, B)).

:- initialization(main).
