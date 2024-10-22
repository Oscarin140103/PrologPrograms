% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que extrae N números
%              aleatorios de un rango dado. Utiliza la
%              función range para generar la lista de
%              números y luego selecciona aleatoriamente.
%              Se incluye una versión comentada 
%              en Python para referencia.
% ===============================================

% -------- Código en Python (comentado) ---------
% Función para extraer N números aleatorios de un rango dado en Python.
% import random
%
% def lotto(n, m):
%     return random.sample(range(1, m + 1), n)  # Selecciona n números únicos del rango
%
% Ejemplo de uso:
% selected_numbers = lotto(6, 49)
% print("Números seleccionados aleatoriamente:", selected_numbers)
%
% Salida esperada:
% Números seleccionados aleatoriamente: [3, 15, 22, 37, 41, 8]  # (Ejemplo; puede variar)
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Extrae N números aleatorios de un rango dado.
% Utiliza la función range para generar la lista de números y luego selecciona aleatoriamente.
lotto(N, M, L) :- 
    range(1, M, R), 
    rnd_select(R, N, L).

% Ejemplo de uso:
% ?- lotto(6, 49, L).
% L = [3, 15, 22, 37, 41, 8].  % (Ejemplo; puede variar)
% ----------------------------------------------
