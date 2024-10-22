% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              el k-ésimo elemento de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para encontrar el k-ésimo elemento de una lista en C#.
%     static T ElementAt<T>(List<T> list, int k)
%     {
%         if (list == null || list.Count < k || k <= 0)
%             throw new ArgumentException("Índice fuera de rango o lista vacía.");
%         
%         return list[k - 1]; // Devuelve el elemento en la posición k (1-based).
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd' };
%         char elemento = ElementAt(lista, 3); // Encuentra el 3er elemento.
% 
%         Console.WriteLine("El elemento en la posición 3 es: " + elemento);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado element_at(X, List, K) que determina 
% el k-ésimo elemento X de la lista List.

% Caso base: el k-ésimo elemento es el primero cuando K = 1.
element_at(X, [X|_], 1).

% Caso recursivo: ignora el primer elemento y reduce K.
element_at(X, [_|T], K) :- 
    K > 1, 
    K1 is K - 1, 
    element_at(X, T, K1).

% Ejemplo de uso:
% ?- element_at(X, [a, b, c, d], 3).
% X = c.
% ----------------------------------------------
