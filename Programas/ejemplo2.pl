% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              el penúltimo elemento de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para encontrar el penúltimo elemento de una lista en C#.
%     static T Penultimate<T>(List<T> list)
%     {
%         if (list == null || list.Count < 2)
%             throw new ArgumentException("La lista debe tener al menos dos elementos.");
%         
%         return list[list.Count - 2]; // Devuelve el penúltimo elemento.
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd' };
%         char penultimoElemento = Penultimate(lista);
% 
%         Console.WriteLine("El penúltimo elemento es: " + penultimoElemento);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado penultimate(X, List) que determina el 
% penúltimo elemento X de la lista List.

% Caso base: el penúltimo elemento es el primero cuando la lista tiene dos elementos.
penultimate(X, [X, _]).

% Caso recursivo: ignora el primer elemento y sigue evaluando.
penultimate(X, [_|T]) :- 
    penultimate(X, T).

% Ejemplo de uso:
% ?- penultimate(X, [a, b, c, d]).
% X = c.
% ----------------------------------------------
