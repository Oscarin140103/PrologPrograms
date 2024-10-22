% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que aplana una lista 
%              anidada en una lista simple.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para aplanar una lista anidada en C#.
%     static List<T> Flatten<T>(List<object> list)
%     {
%         List<T> flatList = new List<T>();
% 
%         foreach (var item in list)
%         {
%             if (item is List<object> sublist)
%             {
%                 flatList.AddRange(Flatten<T>(sublist)); // Aplana la sublista recursivamente.
%             }
%             else if (item is T element)
%             {
%                 flatList.Add(element); // Agrega el elemento a la lista plana.
%             }
%         }
%         return flatList; // Devuelve la lista aplanada.
%     }
% 
%     static void Main()
%     {
%         var listaAnidada = new List<object> { 'a', new List<object> { 'b', 'c' }, 'd', new List<object> { 'e', new List<object> { 'f', 'g' } } };
%         var listaAplanada = Flatten<char>(listaAnidada);
% 
%         Console.WriteLine("La lista aplanada es: " + string.Join(", ", listaAplanada));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado my_flatten(Nested, Flat) que aplana una lista anidada Nested en una lista simple Flat.

% Caso base: la lista vacía se aplana a una lista vacía.
my_flatten([], []).

% Caso recursivo: si la cabeza es una lista, aplana la cabeza y la cola recursivamente.
my_flatten([H|T], Flat) :- 
    my_flatten(H, FH), 
    my_flatten(T, FT), 
    append(FH, FT, Flat).

% Si la cabeza no es una lista, simplemente agrégala al resultado.
my_flatten(X, [X]) :- 
    X \= [], 
    \+ is_list(X).

% Ejemplo de uso:
% ?- my_flatten([a, [b, c], d, [e, [f, g]]], Flat).
% Flat = [a, b, c, d, e, f, g].
% ----------------------------------------------
