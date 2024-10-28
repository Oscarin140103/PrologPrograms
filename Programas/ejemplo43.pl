% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que genera el
%              código Gray de N bits. Se incluye
%              una versión comentada en Python para
%              referencia.
%              La secuencia de código Gray es una
%              secuencia binaria en la que dos valores
%              consecutivos difieren en solo un bit.
% ===============================================

% -------- Código en Python (comentado) ---------
% Genera el código Gray de N bits.
%
% def gray_code(n):
%     if n == 1:
%         return ['0', '1']
%     else:
%         previous_codes = gray_code(n - 1)
%         # Prefijar '0' a la primera mitad y '1' a la segunda mitad.
%         first_half = ['0' + code for code in previous_codes]
%         second_half = ['1' + code for code in reversed(previous_codes)]
%         return first_half + second_half
%
% Ejemplo de uso:
% n = 3
% codes = gray_code(n)
% print(f'Código Gray de {n} bits: {codes}')
%
% Salida esperada:
% Código Gray de 3 bits: ['000', '001', '011', '010', '110', '111', '101', '100']
% ----------------------------------------------

% -------- Código en Prolog --------------------
% gray_code.pl
% Genera el código Gray de N bits.
% https://es.wikipedia.org/wiki/Código_Gray
% La secuencia de código Gray es una secuencia binaria en la que dos valores consecutivos difieren en solo un bit.

gray(1, ['0', '1']).  % Caso base: código Gray de 1 bit.
gray(N, C) :- 
    N > 1, 
    N1 is N - 1, 
    gray(N1, C1), 
    maplist(string_concat('0'), C1, C0),  % Anteponer '0'
    reverse(C1, C1R), 
    maplist(string_concat('1'), C1R, C1G),  % Anteponer '1' a la reversa
    append(C0, C1G, C).  % Combinar ambas listas

main :- 
    N = 3,  % Cambia este valor por la cantidad de bits deseada.
    gray(N, Codes), 
    write('Código Gray de '), write(N), write(' bits:'), nl, 
    write(Codes), nl.

:- initialization(main).
