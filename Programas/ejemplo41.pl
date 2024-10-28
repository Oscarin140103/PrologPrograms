% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que utiliza la
%              tabla de verdad para evaluar expresiones
%              lógicas con dos variables. Se incluye
%              una versión comentada en Python para
%              referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Ejemplo de uso de la tabla de verdad.
%
% def truth_table(expr):
%     values = [True, False]
%     for a in values:
%         for b in values:
%             result = expr(a, b)
%             print(f'{a} {b} {result}')
%
% # Ejemplo de uso de las expresiones lógicas:
% print("Tabla de verdad para A AND B:")
% truth_table(lambda A, B: A and B)
% print("\nTabla de verdad para A OR B:")
% truth_table(lambda A, B: A or B)
% print("\nTabla de verdad para A implica B:")
% truth_table(lambda A, B: not A or B)
%
% Salida esperada:
% Tabla de verdad para A AND B:
% True True True
% True False False
% False True False
% False False False
% ----------------------------------------------

% -------- Código en Prolog --------------------
% truth_table.pl
% Genera una tabla de verdad para expresiones lógicas en dos variables.

% Genera una tabla de verdad para una expresión lógica en dos variables.
% A y B son las variables lógicas y Expr es la expresión lógica que se evalúa.
table(A, B, Expr) :-
    (A = true; A = false),
    (B = true; B = false),
    write(A), write(' '), write(B), write(' '),
    (call(Expr) -> write(true) ; write(false)),
    nl, fail.
table(_, _, _).

% main: Ejemplo de uso de la tabla de verdad
main :-
    write('Tabla de verdad para A and B:'), nl,
    table(A, B, (A, B)),
    nl,
    write('Tabla de verdad para A or B:'), nl,
    table(A, B, (A; B)),
    nl,
    write('Tabla de verdad para A implica B:'), nl,
    table(A, B, (\+ A; B)).

:- initialization(main).
